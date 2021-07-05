//
//  PhotoDetailViewController.swift
//  PhotoCollection2
//
//  Created by brian vilchez on 8/22/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit
import Photos


class PhotoDetailViewController: UIViewController {

    var photoController: PhotoController?
    var photo:Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var PhotoImage: UIImageView!
    @IBOutlet weak var photoTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        setTheme()
         guard let photo = photo else {return}
            PhotoImage.image = UIImage(data: photo.imageData)
            photoTextField.text = photo.title
        
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
        PhotoLibrary()
    }
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
        
        guard let photoName = photoTextField.text, let image = PhotoImage.image?.pngData() else {return}
        if photo == nil {
        photoController?.createPhoto(withTitle: photoName, image: image)
            navigationController?.popToRootViewController(animated: true)
        } else {
            guard let photo = photo else {return}
            photoController?.updatePhoto(photo, data: image, title: photoName)
            navigationController?.popToRootViewController(animated: true)
        }
    }
    

    /// sets the detail view background color to the value of user defaults
    func setTheme() {
        if let selectedTheme = themeHelper?.themePreference {
            if selectedTheme == "Dark" {
                view.backgroundColor = .darkGray
            } else if selectedTheme == "blue" {
               view.backgroundColor = .blue
            }
        }
    }
}

extension PhotoDetailViewController: UIImagePickerControllerDelegate {
    
    private func PhotoLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self;
            myPickerController.sourceType = .photoLibrary
            self.present(myPickerController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        PhotoImage.image = image
        dismiss(animated: true, completion: nil)
    }
}

extension PhotoDetailViewController: UINavigationControllerDelegate {
    
}
