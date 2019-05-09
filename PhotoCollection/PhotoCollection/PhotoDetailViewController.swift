//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Ryan Murphy on 5/9/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit



class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateViews()
    }
    
    func setTheme() {
        guard let themePreference = themeHelper?.themePreference else {return}
        switch themePreference {
        case "Dark":
            view.backgroundColor = .gray
        case "Blue":
            view.backgroundColor = .blue
        default:
            return
        }
        
    }
    
    func updateViews() {
        setTheme()
        if let photo = photo {
            photoImageView.image = UIImage(data: photo.imageData)
        }
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[.originalImage] as? UIImage else { return }
        
        photoImageView.image = image
    }

    @IBAction func saveButtonPressed(_ sender: Any) {
        guard let title = inputTextField.text else {
            print("Error: no title")
            return
        }
        guard let image = photoImageView.image else {
            print("Error: there is no image in the view.")
            return
        }
        guard let imageData = image.pngData() else {
            print("Error: image could not be converted to data")
            return
        }
        photoController?.createPhoto(title: title, image: imageData)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addPhotoButtonPressed(_ sender: Any) {
        let pickerVC = UIImagePickerController()
        pickerVC.sourceType = .photoLibrary
        pickerVC.allowsEditing = false
        pickerVC.delegate = self
        present(pickerVC, animated: true, completion: nil)
    }
    
}
