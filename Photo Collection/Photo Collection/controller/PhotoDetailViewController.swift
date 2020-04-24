//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Vincent Hoang on 4/23/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

import UIKit
import os.log

class PhotoDetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var titleTextField: UITextField?
    @IBOutlet var photoImageView: UIImageView?
    @IBOutlet var saveButton: UIBarButtonItem?
    
    @IBAction func addPhotoButtonPressed(_ sender: UIButton) {
        titleTextField?.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleTextField?.delegate = self
        
        if let photo = photo {
            photoImageView?.image = UIImage(data: photo.imageData)
            titleTextField?.text = photo.title
        }
        
        updateSaveButtonState()
    }
    
    func setTheme() {
        if themeHelper?.themePreference == "light" {
            view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        photoImageView?.image = selectedImage
        
        dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton?.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = titleTextField?.text
    }
    
    private func updateSaveButtonState() {
        let text = titleTextField?.text ?? ""
        saveButton?.isEnabled = !text.isEmpty
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        guard let unwrappedImageData = photoImageView?.image, let unwrappedTitle = titleTextField?.text else {
            fatalError("Invalid image or title")
        }
        
        guard let unwrappedPNGData = unwrappedImageData.pngData() else {
            fatalError("Unable to retrieve png data")
        }
        
        photo = Photo(unwrappedPNGData, unwrappedTitle)
    }

}
