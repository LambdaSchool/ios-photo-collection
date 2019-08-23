//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Jordan Christensen on 8/23/19.
//  Copyright © 2019 Mazjap Co Technologies. All rights reserved.
//

import UIKit
import PhotosUI
import Photos

class PhotoDetailViewController: UIViewController,
UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func setTheme() {
        guard let theme = themeHelper?.themePreference else {
            view.backgroundColor = .darkGray
            return
        }
        if theme == "Dark" {
            view.backgroundColor = .darkGray
        } else {
            view.backgroundColor = .blue
        }
    }
    
    @IBAction func addPhotoTapped(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.contentMode = .scaleAspectFit
            imageView.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        guard let name = nameTextField.text, let data = imageView.image else { return }
        if let photo = photo {
            photoController?.update(from: photo, title: name, data: data)
        } else {
            photoController?.addPhoto(title: name, data: data)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    func updateViews() {
        setTheme()
        
        if let photo = photo {
            nameTextField.text = photo.title
            imageView.image = photo.data
        }
    }
}
