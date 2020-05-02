//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Dawn Jones on 4/30/20.
//  Copyright © 2020 Dawn Jones. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        setTheme()
        updateViews()
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = false
        pickerController.mediaTypes = ["public.image"]
        pickerController.sourceType = .photoLibrary
        
        present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        guard let pic = photoView.image,
            let title = titleTextField.text,
            let data = pic.pngData() else { return }
        
        if let photo = self.photo {
            photoController?.updatePhoto(photo: photo, data: data, title: title)
        } else {
            photoController?.createPhoto(data: data, title: title)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    func setTheme() {
        guard let theme = themeHelper?.themePreference else { return }
        
        if theme == "Dark" {
            self.view.backgroundColor = UIColor.darkGray
        } else {
            self.view.backgroundColor = UIColor.green
        }
    }
    
    func updateViews() {
        guard let photo = self.photo else { return }
        
        photoView.image = UIImage(data: photo.imageData)
        titleTextField.text = photo.title
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            photoView.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }

}
