//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Ciara Beitel on 8/22/19.
//  Copyright © 2019 Joshua Sharp. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func saveTapped(_ sender: Any) {
        if let photo = photo {
            photoController?.update(photo, image: photo.imageData, title: textField.text ?? "")
        } else {
            guard let imageData = imageView.image else { return }
            photoController?.create(textField.text ?? "", imageData)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addPhotoTapped(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        updateViews()
    }
    
    func updateViews() {
        if let themeHelper = themeHelper {
            themeHelper.setTheme(view: view)
        }
        guard let photo = photo else { return }
        textField.text = photo.title
        imageView.image = photo.imageData
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.contentMode = .scaleAspectFit
            imageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
}
