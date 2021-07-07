//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Daniela Parra on 9/6/18.
//  Copyright © 2018 Daniela Parra. All rights reserved.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    func setTheme() {
        guard let themeHelper = themeHelper else { return }
        
        let themePreference = themeHelper.themePreferenceKey
        
        if themePreference == "Dark" {
            view.backgroundColor = UIColor.lightGray
        } else if themePreference == "Yellow" {
            view.backgroundColor = UIColor.yellow
        }
    }
    
    private func updateViews() {
        setTheme()
        
        guard let photo = photo else {
            title = "Create Photo"
            return }
        
        title = ""
        
        photoImageView.image = UIImage(data: photo.imageData)
        addPhotoButton.setTitle("Change Button", for: .normal)
        titleTextField.text = photo.title
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        guard let title = titleTextField.text,
            let photoImage = photoImageView.image,
            let imageData = UIImagePNGRepresentation(photoImage) else { return }
        
        if let photo = photo {
            //Update it.
            photoController?.update(photo: photo, imageData: imageData, title: title)
            
        } else {
            //Create a new one.
            photoController?.create(imageData: imageData, title: title)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        
        let status = PHPhotoLibrary.authorizationStatus()
        
        if status == .authorized {
            presentImagePickerController()
        } else if status == .notDetermined {
            PHPhotoLibrary.requestAuthorization { (authorizationStatus) in
                if authorizationStatus == .authorized {
                    self.presentImagePickerController()
                }
            }
        }
    }


    func presentImagePickerController() {
        
        let imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            present(imagePicker, animated: true, completion: nil)
        }
    }

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }
        
        photoImageView.image = image
    }
    
    var photo: Photo?
    var photoController: PhotoController?
    var themeHelper: ThemeHelper?
    
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    
}
