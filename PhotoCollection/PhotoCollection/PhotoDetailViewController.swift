//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Dojo on 6/13/20.
//  Copyright © 2020 Dojo. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var addTitleTextField: UITextField!
    
    
    // MARK: - Properties
    var photoContoller: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    var imagePicker = UIImagePickerController()
    
    // MARK: - IBActions
    @IBAction func addPhoto(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        if let photo = photo,
            let photoTitle = addTitleTextField.text,
            !photoTitle.isEmpty,
            let image = photoImageView.image {
            photoContoller?.updatePhoto(photo: photo, title: photoTitle, imageData: image)
        } else if let photoName = addTitleTextField.text,
            !photoName.isEmpty,
            let image = photoImageView.image {
            photoContoller?.createPhoto(title: photoName, imageData: image)
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        imagePicker.delegate = self
    }
    
    func setTheme() {
        guard let theme = themeHelper?.themePreference else { return }
        switch theme {
        case .dark:
            view.backgroundColor = .darkGray
        case .light:
            view.backgroundColor = .white
        default:
            view.backgroundColor = .white
        }
    }
    
    func updateViews() {
        setTheme()
        guard let photo = photo else { return }
        photoImageView.image = UIImage(data: photo.imageData)
        addTitleTextField.text = photo.title
    }
    
}

extension PhotoDetailViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            photoImageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
