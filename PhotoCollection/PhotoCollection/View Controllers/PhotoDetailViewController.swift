//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by John Kouris on 8/15/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var addTitleTextField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        
        navigationItem.largeTitleDisplayMode = .never
        
        imagePicker.delegate = self
    }
    
    
    @IBAction func addPhotoButtonTapped(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let title = addTitleTextField.text,
            let image = imageView.image,
            let imageData = image.pngData() else { return }
        
        if let photo = photo {
            photoController?.update(photo: photo, image: imageData, title: title)
        } else {
            photoController?.create(image: imageData, title: title)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    func setTheme() {
        guard let themeHelper = themeHelper,
            let currentTheme = themeHelper.themePreference else { return }
        if currentTheme == "Dark" {
            view.backgroundColor = .darkGray
        } else if currentTheme == "Blue" {
            view.backgroundColor = .blue
        }
    }
    
    func updateViews() {
        setTheme()
        addPhotoButton.layer.cornerRadius = 10
        
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
        addTitleTextField.text = photo.title
    }
    
    // MARK: - UIImagePickerControllerDelegate Methods
    
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
    
}
