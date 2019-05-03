//
//  PhotoDetailViewController.swift
//  Photos
//
//  Created by Victor  on 5/2/19.
//  Copyright © 2019 com.Victor. All rights reserved.
//

import Foundation
import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var textFeild: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func updateViews() {
        setTheme()
        guard let photo = photo else {
            print("No photo")
            return
        }
            let image = UIImage(data: photo.imageData)
            imageView.image = image
            textFeild.text = photo.title
        print("Photo")
    }
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        //research
        //library
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        //
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //getting user input and converting to ui image\
    
        guard let original = info[.originalImage] as? UIImage else {
            print("no image")
            return
        }
        //imageView.contentMode = .scaleAspectFit
        imageView.image = original
        picker.dismiss(animated: true, completion: nil)
        //library view will disappear
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        guard let title = textFeild.text, let image = imageView.image, let data = image.pngData() else {
            //pop out
            return
        }
        
        
        if let photoObject = photo {
            photoController?.update(photo: photoObject, imageData: data, title: title)
            print("updated photo")
        } else {
            photoController?.create(imageData: data, title: title)
            print("created photo")
        }
        //taking us back to the home page
        navigationController?.popViewController(animated: true)
    }
    
    
    func setTheme() {
        guard let theme = themeHelper?.themePreference else { return }
        
        if theme == "Light" {
            view.backgroundColor = .white
        } else if theme == "Dark" {
            view.backgroundColor = .gray
        }
        
    }
    
    
    
    
}

