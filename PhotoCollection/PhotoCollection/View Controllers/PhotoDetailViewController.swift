//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Nathanael Youngren on 1/16/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        imageView.image = image
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
        guard let image = imageView.image,
        let imageData = image.pngData(),
        let text = textField.text, !text.isEmpty,
        let photoController = photoController else { return }
        
        if let unwrappedPhoto = photo {
            photoController.update(photo: unwrappedPhoto, data: imageData, string: text)
            navigationController?.popToRootViewController(animated: true)
        } else {
            photoController.create(imageData: imageData, title: text)
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func setTheme() {
        guard let currentTheme = themeHelper?.themePreference else { return }
        
        if currentTheme == "Dark" {
            view.backgroundColor = .gray
        } else if currentTheme == "Yellow" {
            view.backgroundColor = .yellow
        }
    }
    
    func updateViews() {
        setTheme()
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
        textField.text = photo.title
    }
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

}
