//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Dillon P on 8/15/19.
//  Copyright © 2019 Dillon P. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var photoTitleTextField: UITextField!
    
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        picker.delegate = self
    }
    
    
    @IBAction func addPhoto(_ sender: Any) {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        if photo != nil {
            guard let photo = photo else { return }
            var newPhoto = photo
            guard let imageData = imageView.image?.pngData(),
                let title = photoTitleTextField.text,
                !title.isEmpty else { return }
            
            newPhoto.title = title
            newPhoto.imageData = imageData
            
            if let index = photoController?.photos.firstIndex(of: photo) {
                photoController?.photos[index] = newPhoto
            }
        } else if photo == nil {
            if let title = photoTitleTextField.text,
                let image = imageView.image,
                let imageData = image.pngData() {
                let newPhoto = Photo(title: title, imageData: imageData)
                photoController?.photos.append(newPhoto)
            }
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        
        if themePreference == "Dark" {
            view.backgroundColor = .lightGray
        } else if themePreference == "Red" {
            view.backgroundColor = .red
        }
    }
    
    private func updateViews() {
        setTheme()
        guard let photo = photo else { return }
        let imageData = photo.imageData
        if let image = UIImage(data: imageData) {
            imageView.image = image
        }
        photoTitleTextField.text = "\(photo.title)"
        self.title = photo.title
    }

}

extension PhotoDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        imageView.contentMode = .scaleAspectFit
        imageView.image = chosenImage
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

