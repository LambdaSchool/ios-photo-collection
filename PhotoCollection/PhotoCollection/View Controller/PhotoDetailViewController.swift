//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Claudia Contreras on 2/20/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: - IBOutlets
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var photoTitleTextField: UITextField!
    
    
    //MARK: - Properties
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        updateViews()
    }
    
    //MARK: - IBActions
    @IBAction func addPhotoButtonTapped(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        guard let photoController = photoController else { return }
        
        guard let title = photoTitleTextField.text, !title.isEmpty,
            let imageData = photoImageView.image?.pngData() else { return }
        
        if let photo = photo {
            print("updating image")
            photoController.update(Photo: photo, data: imageData, title: title)
        } else {
            print("new image added")
            photoController.create(imageData: imageData, title: title)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: - Functions
    func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        print("Theme Preference: \(themePreference)")
        //Change the view's background color
        if themeHelper?.themePreference == "Dark" {
            view.backgroundColor = .darkGray
        } else {
            view.backgroundColor = .cyan
        }
    }
    
    func updateViews() {
        guard let photo = photo else { return }
        photoTitleTextField.text = photo.title
        photoImageView.image = UIImage(data: photo.imageData)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        
        photoImageView.image = image
        dismiss(animated: true)
    }

}
