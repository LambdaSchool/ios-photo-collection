//
//  AddPhotoViewController.swift
//  Photo Collection
//
//  Created by Lambda_School_Loaner_259 on 2/27/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
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
            let photoName = addTitleTextField.text,
            !photoName.isEmpty,
            let image = photoImageView.image {
            photoContoller?.updatePhoto(photo: photo, name: photoName, imageData: image)
        } else if let photoName = addTitleTextField.text,
            !photoName.isEmpty,
            let image = photoImageView.image {
            photoContoller?.createPhoto(name: photoName, imageData: image)
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
        addTitleTextField.text = photo.name
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
