//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Donella Barcelo on 11/14/19.
//  Copyright © 2019 Donella Barcelo. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    @IBOutlet weak var addPhotoImageView: UIImageView!
    @IBOutlet weak var addTitleTextField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        setTheme()
        guard let imageData = photo?.imageData else { return }
        
        addPhotoImageView.image = UIImage(data: imageData)
        addTitleTextField.text = photo?.title
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate & UICollectionViewDelegateFlowLayout
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancelAlert = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAlert)
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibrary = UIAlertAction(title: "Photo Library", style: .default, handler: {
                (_) in imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(photoLibrary)
        }
        present(alertController,animated: true, completion: nil)
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        guard let title = addTitleTextField.text, let data = addPhotoImageView.image?.pngData() else { return }
        if let photo = photo {
            photoController?.updatePhoto(photo: photo, data: data, title: title)
        } else {
            photoController?.createPhoto(data: data, title: title)
        }
        navigationController?.popViewController(animated: true)
    }
    
    func setTheme() {
        guard let themePreference = themeHelper?.themePreferenceKey else { return }
        switch themePreference {
        case ThemeHelper.PropertyKeys.dark:
            view.backgroundColor = .darkGray
        case ThemeHelper.PropertyKeys.blue:
            view.backgroundColor = .blue
        default:
            view.backgroundColor = .white
        }
    }
}

extension PhotoDetailViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate, UICollectionViewDelegateFlowLayout {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage, let _ = image.pngData() else { return }
        
        addPhotoImageView.image = image
        
        dismiss(animated: true, completion: self.updateViews)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
