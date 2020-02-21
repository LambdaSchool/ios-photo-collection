//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Elizabeth Thomas on 2/20/20.
//  Copyright © 2020 Libby Thomas. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    var imagePicker = UIImagePickerController()
    
    // MARK: - IBOutlets
    @IBOutlet weak var photoDetailImageView: UIImageView!
    @IBOutlet weak var photoTitleTextField: UITextField!
    

    // MARK: - IBActions
    @IBAction func addPhoto(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        guard let image = photoDetailImageView.image,
            let imageData = image.pngData(),
            let title = photoTitleTextField.text else { return }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            photoDetailImageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func setTheme() {
        guard themeHelper?.themePreference == nil else { return }
        if themeHelper?.themePreference == "Dark" {
            self.view.backgroundColor = .darkGray
        } else if themeHelper?.themePreference == "Green" {
            self.view.backgroundColor = .green
        }
    }
    
    func updateViews() {
        guard let photo = photo else { return }
        
        photoDetailImageView.image = UIImage(data: photo.imageData)
        photoTitleTextField.text = photo.title
    }
      override func viewDidLoad() {
            super.viewDidLoad()
            setTheme()
            updateViews()
        }
        
}


    
