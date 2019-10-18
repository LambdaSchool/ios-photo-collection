//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Lambda_School_Loaner_204 on 10/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    // MARK: - IBOutlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var photoTextField: UITextField!
    
    // MARK: - Properties
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateViews()
    }
    
    // MARK: - Class Functions
    
    private func updateViews() {
        setTheme()
        
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
        photoTextField.text = photo.title
    }
    
    func setTheme() {
        guard let themeHelper = themeHelper else { return }
        
        if let themePreference = themeHelper.themePreference {
            if (themePreference == "Dark") {
                view.backgroundColor = UIColor.darkGray
            } else if (themePreference == "Blue") {
                view.backgroundColor = UIColor.blue
            }
        }
    }
    
    private func presentImagePickerController() {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
        
        let imagePicker = UIImagePickerController()
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        
        imageView.image = image
    }
    

    // MARK: - IBActions
    
    @IBAction func addPhotoTapped(_ sender: UIButton) {
        
        let authorizationStatus = PHPhotoLibrary.authorizationStatus()
        
        switch authorizationStatus {
        case .authorized:
            presentImagePickerController()
            
        case .notDetermined:
            
            PHPhotoLibrary.requestAuthorization { (status) in
                
                guard status == .authorized else { NSLog("User did not authorize access to the photo library"); return }
                
                self.presentImagePickerController()
            }
            
        default:
            break
        }

    }
    
    @IBAction func savePhotoTapped(_ sender: UIBarButtonItem) {
        guard let photoController = photoController,
            let image = imageView.image,
            let imageData = image.pngData(),
            let textTitle = photoTextField.text,
            !textTitle.isEmpty else { return }
        
        if let photo = photo {
            photoController.updatePhoto(for: photo, updatedData: imageData, updatedTitle: textTitle)
        } else {
            photoController.createPhoto(imageData, textTitle)
        }
        self.navigationController?.popToRootViewController(animated: true)
    }
 
}

