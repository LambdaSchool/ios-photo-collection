//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Dillon McElhinney on 9/6/18.
//  Copyright © 2018 Dillon McElhinney. All rights reserved.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - Properties
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var addPhotoButton: UIButton!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }

    // MARK: - UI Methods
    @IBAction func addPhoto(_ sender: Any) {
        // Check authorization status for the photo library
        let status = PHPhotoLibrary.authorizationStatus()
        
        if status == .authorized {
            // If authorized, present the image picker
            presentImagePickerController()
        } else if status == .notDetermined {
            // If it is not determined, ask for authorization
            PHPhotoLibrary.requestAuthorization { (status) in
                //If it comes back as authorized, present the image picker
                if status == .authorized {
                    self.presentImagePickerController()
                }
            }
        }
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty,
            let image = photoImageView.image,
        let imageData = UIImagePNGRepresentation(image) else { return }
        
        if let photo = photo {
            // If there is a photo already, update it
            photoController?.update(photo: photo, title: title, imageData: imageData)
        } else {
            // Otherwise, create a new one
            photoController?.createPhoto(title: title, imageData: imageData)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - UI Image Picker Controller Delegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        addPhotoButton.setTitle("Change Photo", for: .normal)
        //Dismiss the picker
        picker.dismiss(animated: true, completion: nil)
        //Get the image from the info dictionary
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        //Set the image view's image
        photoImageView.image = image
    }
    
    // MARK: Private Utility Methods
    private func updateViews() {
        setTheme()
        guard let photo = photo else {
            title = "Add Photo"
            return
        }
        
        title = "Edit Photo"
        photoImageView.image = UIImage(data: photo.imageData)
        titleTextField.text = photo.title
        addPhotoButton.setTitle("Change Photo", for: .normal)
    }
    
    private func setTheme() {
        guard themeHelper?.themePreference != nil else { return }
        
        view.backgroundColor = ThemeHelper.backgroundColor
        titleTextField.backgroundColor = ThemeHelper.backgroundColor
        titleTextField.textColor = ThemeHelper.bodyTextColor
        
    }
    
    private func presentImagePickerController() {
        // Check to see if the source type is available
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
        
        //Instantiate an image picker
        let imagePicker = UIImagePickerController()
        //Set the source type
        imagePicker.sourceType = .photoLibrary
        //Set the delegate
        imagePicker.delegate = self
        //Present the picker
        present(imagePicker, animated: true, completion: nil)
    }

}
