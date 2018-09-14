//
//  PhotoDetailViewController.swift
//  Photo-Collection
//
//  Created by Ilgar Ilyasov on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - Properties
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var addPhotoButtonOutlet: UIButton!
    @IBOutlet weak var photoTextField: UITextField!
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        // setTheme()
        
        if let photo = photo {
            photoTextField.text = photo.title
            photoImageView.image = UIImage(data: photo.imageData)
            self.navigationItem.title = "Edit Photo"
            addPhotoButtonOutlet.setTitle("Change Photo", for: .normal)
        } else {
            self.navigationItem.title = "Create Photo"
            addPhotoButtonOutlet.setTitle("Add Photo", for: .normal)
        }
    }
    
    @IBAction func addPhotoTapped(_ sender: Any) {
        let status = PHPhotoLibrary.authorizationStatus()
        
        if status == .authorized {
            presentImagePickerController()
        } else if status == .notDetermined {
            PHPhotoLibrary.requestAuthorization { (status) in
                guard status == .authorized else {
                    NSLog("Please go to the settings and allow Memories access to your Photo Library")
                    return
                }
            }
        }
    }
    
    @IBAction func saveBarButtonTapped(_ sender: Any) {
        guard let title = photoTextField.text, title != "",
              let image = photoImageView.image,
              let imageData = UIImageJPEGRepresentation(image, 1.0) else { return }
        
        if let photo = photo {
            photoController?.updatePhoto(photo: photo, title: title, imageData: imageData)
        } else {
            photoController?.createPhoto(title: title, imageData: imageData)
        }
        navigationController?.popViewController(animated: true)
    }
    
//    Create a setTheme function.
//    This should do the same thing as the setTheme method in your collection view controller,
//    except that it should change the view controller's view's background color instead.
    
//    func setTheme() {
//
//    }
    
    // MARK: - Image picker
    
    func presentImagePickerController() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            
            DispatchQueue.main.async {
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }
        photoImageView.image = image
    }
    
    
}
