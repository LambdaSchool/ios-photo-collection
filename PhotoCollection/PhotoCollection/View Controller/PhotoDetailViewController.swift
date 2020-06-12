//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Norlan Tibanear on 6/11/20.
//  Copyright © 2020 Norlan Tibanear. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet var photoTextField: UITextField!
    @IBOutlet var photoImageView: UIImageView!
    
    // Properties Var
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemHelper?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        updateView()
    }
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        updateView()
//    }
    
    
    func updateView() {
//        setTheme()
        
        guard let photo = photo else { return }
        self.photoTextField.text = photo.title
        self.photoImageView.image = UIImage(data: photo.imageData)
        
    }
    

    @IBAction func addPhotoBtn(_ sender: UIButton) {
        addPhotoPickerController()
    }
    
    
    @IBAction func saveBtn(_ sender: UIBarButtonItem) {
        
        guard let title = photoTextField.text else { return }
        guard let image = photoImageView.image else { return }
        guard let imageData = image.pngData() else { return }
        
        if let photo = photo {
            photoController?.updatePhoto(photo: photo, data: imageData, string: title)
        } else {
            photoController?.create(title: title, imageData: imageData)
        }
        navigationController?.popViewController(animated: true)
    }
    
//   private func setTheme() {
//    let theme = self.themeHelper?.themePreference()
//        if theme == "Dark" {
//            self.view.backgroundColor = UIColor.systemGray
//        } else if theme == "Light" {
//            self.view.backgroundColor = UIColor.systemPink
//        }
//
//    }
    
    
    func addPhotoPickerController(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        photoImageView.image = image
    }
    
    
} // END
