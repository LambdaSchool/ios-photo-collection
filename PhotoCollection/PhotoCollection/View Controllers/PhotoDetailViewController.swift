//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Linh Bouniol on 8/2/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    var photoController: PhotoController?
    
    var themeHelper: ThemeHelper? {
        didSet {
            setTheme()
        }
    }

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var textField: UITextField!
    
    @IBAction func addPhoto(_ sender: Any) {
        presentImagePickerController()
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        // Make sure everything exists
        guard let title = textField.text, let image = imageView.image, let imageData = UIImagePNGRepresentation(image) else { return }
        
        if let photo = photo {
            photoController?.update(photo: photo, title: title, imageData: imageData)
        } else {
            photoController?.createPhoto(withTitle: title, imageData: imageData)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
        setTheme()
    }

    func setTheme() {
        guard let themePreference = themeHelper?.themePreference, self.isViewLoaded else { return }
        
        if themePreference == "Pink" {
            self.view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        } else {
            self.view.backgroundColor = UIColor.darkGray
        }
    }
    
    func updateViews() {
        if let photo = photo {
            navigationItem.title = "Edit Photo"
            imageView?.image = UIImage(data: photo.imageData)
            textField?.text = photo.title
        } else {
            navigationItem.title = "Add Photo"
        }
        
    }

    // MARK: - UIImagePickerControllerDelegate
    
    func presentImagePickerController() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // Dismiss the photo library
        picker.dismiss(animated: true, completion: nil)
        
        // Get image the user picked
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }
        imageView.image = image
    }
}





