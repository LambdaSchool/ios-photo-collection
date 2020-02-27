//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Wyatt Harrell on 2/27/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addPhotoButton: UIButton!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPhotoButton.layer.cornerRadius = 8
        imagePicker.delegate = self
        setTheme()
        updateViews()
    }
    
    

    @IBAction func addPhotoButtonTapped(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
            
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.contentMode = .scaleAspectFit
            imageView.image = pickedImage
        }
     
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        if photo == nil {
            guard let title = nameTextField.text, !title.isEmpty else { return }
            
            guard let image = imageView.image else { return }
            
            photoController?.create(title: title, imageData: image.pngData()!)
        } else {
            guard let title = nameTextField.text, !title.isEmpty else { return }

            guard let image = imageView.image else { return }
            
            photoController?.update(photo: photo!, imageData: image.pngData()!, title: title)
        }
        
        navigationController?.popViewController(animated: true)
        
    }
    
    func updateViews() {
        guard let photo = photo else { return }
        
        imageView.image = UIImage(data: photo.imageData)
        nameTextField.text = photo.title
    }
    
    func setTheme() {
        guard let theme = themeHelper?.themePreference else { return }

        if theme == "Light" {
            view.backgroundColor = .white
            print("light")
        } else if theme == "Dark" {
            view.backgroundColor = .darkGray
            print("dark")
        }
    }
}
