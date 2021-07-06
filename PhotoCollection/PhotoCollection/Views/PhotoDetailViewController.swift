//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Kobe McKee on 5/9/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        setTheme()
    }
    
    
    func updateViews() {
        if let photo = photo {
            navigationItem.title = "Update Photo"
            let image = UIImage(data: photo.imageData)
            newImageView.image = image
            newImageTitle.text = photo.title
        } else {
            navigationItem.title = "Add Photo"
        }
    }
    
    
    func setTheme() {
        guard let theme = themeHelper?.themePreference else { return }
        print(theme)
        if theme == "Dark" {
            view.backgroundColor = .darkGray
        } else if theme == "Blue" {
            view.backgroundColor = UIColor(red: 0, green: 84, blue: 147, alpha: 1)
        }
    }
    
    
    @IBOutlet weak var newImageView: UIImageView!
    @IBOutlet weak var newImageTitle: UITextField!
    
    
    
    @IBAction func addPhoto(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func savePhoto(_ sender: Any) {
  
        guard let title = newImageTitle.text,
            let image = newImageView.image,
            let imageData = image.pngData() else { return }
        
        if let photo = photo {
            photoController?.updatePhoto(photo: photo, imageData: imageData, title: title)
        } else {
            photoController?.createPhoto(imageData: imageData, title: title)
        }
        navigationController?.popViewController(animated: true)
    }
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        newImageView.image = image
    }
    

}
