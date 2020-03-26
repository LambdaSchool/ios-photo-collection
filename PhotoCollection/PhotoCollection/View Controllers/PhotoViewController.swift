//
//  PhotoViewController.swift
//  PhotoCollection
//
//  Created by Hunter Oppel on 3/26/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    
    // MARK: - Properties
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    let pickerController = UIImagePickerController()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        setTheme()
        updateViews()

        pickerController.delegate = self
        pickerController.mediaTypes = ["public.image"]
    }
    
    func updateViews() {
        guard let photo = photo else {return}
        
        let image = photo.imageData
        imageView.image = UIImage(data: image)
        
        nameTextField.text = photo.title
    }
    
    // MARK: - Actions
    
    @IBAction func addPhoto(_ sender: Any) {
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true)
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        if let photo = photo,
            let photoIndex = photoController?.photos.firstIndex(of: photo),
            let data = imageView.image?.pngData(),
            let name = nameTextField.text {
            
            photoController?.photos[photoIndex].imageData = data
            photoController?.photos[photoIndex].title = name
            
            navigationController?.popViewController(animated: true)
        } else if let image = imageView.image?.pngData(),
            let name = nameTextField.text {
            
            photoController?.createPhoto(imageData: image, title: name)
            
            navigationController?.popViewController(animated: true)
        } else {
            return
        }
    }
    
    // MARK: - Functions
    
    func setTheme() {
        guard let theme = themeHelper?.themePreference else {return}
        
        if theme == "Dark" {
            view.backgroundColor = .darkGray
        } else if theme == "White" {
            view.backgroundColor = .white
        }
    }
}

extension PhotoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func pickerController(_ controller: UIImagePickerController, didSelect image: UIImage?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {
            return self.pickerController(picker, didSelect: nil)
        }
        
        imageView.image = image
        picker.dismiss(animated: true, completion: nil)
    }
}
