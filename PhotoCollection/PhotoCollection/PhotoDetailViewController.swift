//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Josh Kocsis on 4/30/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var photoDetailView: UIImageView!
    @IBOutlet weak var photoTextField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    func updateViews() {
        setTheme()
        guard let photo = photo else { return }
        photoDetailView.image = UIImage(data: photo.imageData)
        photoTextField.text = photo.title
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    func setTheme() {
        guard let theme = themeHelper?.themePreference else { return }
        if theme == "Dark" {
            view.backgroundColor = UIColor.darkGray
        } else if theme == "Red" {
            view.backgroundColor = UIColor.red
        }
        
    }
    @IBAction func addPhotoTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let imagePicker = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        photoDetailView.image = imagePicker
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let image = photoDetailView.image,
            let png = image.pngData(),
            let title = photoTextField.text else { return }
        if let photo = photo {
        photoController?.update(photo: photo, imageData: png, title: title)
        } else {
        photoController?.create(imageData: png, title: title)
        }
        self.navigationController?.popToRootViewController(animated: true)
    }
}
