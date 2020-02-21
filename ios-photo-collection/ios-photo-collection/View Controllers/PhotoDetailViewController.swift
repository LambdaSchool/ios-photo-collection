//
//  PhotoDetailViewController.swift
//  ios-photo-collection
//
//  Created by Matthew Martindale on 2/19/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    var imagePicker = UIImagePickerController()

    @IBOutlet weak var photoAddedImageView: UIImageView!
    @IBOutlet weak var photoTitleTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        updateTheme()
    }
    
    func updateTheme() {
        if themeHelper?.themePreference == "Dark" {
            self.view.backgroundColor = #colorLiteral(red: 0.1764146984, green: 0.1993693411, blue: 0.2962295413, alpha: 1)
        } else if themeHelper?.themePreference == "Gold" {
            self.view.backgroundColor = #colorLiteral(red: 1, green: 0.8357229829, blue: 0, alpha: 1)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            photoAddedImageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }

    @IBAction func addPhotoButtonPressed(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        guard let image  = photoAddedImageView.image,
            let imageData = image.pngData(),
            let title = photoTitleTextField.text else { return }
        photoController?.create(title: title, imageData: imageData)
        
        navigationController?.popViewController(animated: true)
    }
}


