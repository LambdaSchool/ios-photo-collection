//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Sameera Leola on 12/6/18.
//  Copyright © 2018 Sameera Leola. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var photoTitleTextField: UITextField!
    
    
    @IBAction func addPhoto(_ sender: Any) {
       //Make sure the picker type is available
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
        
        //Make an instance of the picker
        let imagePicker = UIImagePickerController()
        //Create one
        imagePicker.sourceType = .photoLibrary
        //Create a delegate
        imagePicker.delegate = self
        //Show the imagePicker
        present(imagePicker, animated: true)
        
        
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        //Get the title
        guard let title = photoTitleTextField.text else { return }
        guard let image =  photoImageView.image  else { return }
        guard let imageData = image.pngData() else { return }
        
        PhotoModel.shared.addPhoto(title: title, imageData: imageData)
        
        //Pop the screen
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Image Picker Controller
    //Called when the user is done picking image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        defer { picker.dismiss(animated: true)}
        guard let image = info[.originalImage] as? UIImage else { return }
        photoImageView.image = image
    }
    
}
