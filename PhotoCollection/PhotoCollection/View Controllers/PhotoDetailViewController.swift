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
        photoController?.createPhoto(imageData: imageData, title: title)
        photoDetailImageView.image = image
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            photoDetailImageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func setTheme() {
        guard let preference = themeHelper?.themePreference else { return }
        if preference == "Dark" {
            view.backgroundColor = .darkGray
        } else if preference == "Green" {
            view.backgroundColor = .green
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setTheme()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setTheme()
    }
        
}


    
