//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Jeffrey Carpenter on 5/2/19.
//  Copyright © 2019 Jeffrey Carpenter. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    @IBOutlet weak var addPhotoImageView: UIImageView!
    @IBOutlet weak var photoTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateViews()
    }
    
    func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        switch themePreference {
        case "Dark":
            view.backgroundColor = .gray
        case "Red":
            view.backgroundColor = .magenta
        default :
            return
        }
    }
    
    func updateViews() {
        setTheme()
        if let photo = photo {
            addPhotoImageView.image = UIImage(data: photo.imageData)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[.originalImage] as? UIImage else { return }
        
        addPhotoImageView.image = image
    }
    
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
        guard let title = photoTextField.text else {
            print("Error: no title")
            return
        }
        guard let image = addPhotoImageView.image else {
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
    
    @IBAction func addPhoto(_ sender: UIButton) {
        print("add photo button pressed")
        let pickerVC = UIImagePickerController()
        pickerVC.sourceType = .photoLibrary
        pickerVC.allowsEditing = false
        pickerVC.delegate = self
        present(pickerVC, animated: true, completion: nil)
    }
}
