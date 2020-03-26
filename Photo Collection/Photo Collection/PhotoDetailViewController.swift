//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Chris Dobek on 3/26/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        setTheme()
        updateViews()
    }
    
    @IBAction func addPhoto(_ sender: Any) {
       let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
    
    func setTheme() {
        if let themeHelper = themeHelper {
                   if themeHelper.themePreference == "Dark" {
                       view.backgroundColor = .darkGray
                   } else {
                       view.backgroundColor = .blue
                   }
        }
    }
        
        func updateViews() {
            if let photo = photo {
                imageView.image = UIImage(data: photo.imageData)
                titleTextField.text = photo.title
            }
        }
    
    @IBAction func savePhoto(_ sender: Any) {
        if let photo = photo {
            if let photoController = photoController {
                if let text = titleTextField.text, !text.isEmpty, let photoData = imageView.image?.pngData() {
                    photoController.update(photo: photo, title: text, imageData: photoData)
                }
            } else {
                if let photoController = photoController {
                    if let text = titleTextField.text, !text.isEmpty {
                        let photoData = imageView.image?.jpegData(compressionQuality: 1)
                        photoController.createPhoto(title: text, imageData: photoData!)
                    }
                }
            }
            navigationController?.popViewController(animated: true)
            
    }
}
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        
        imageView.image = image
        dismiss(animated: true, completion: nil)
    }

}
