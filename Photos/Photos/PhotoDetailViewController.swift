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
    
    //checking for controllers/data
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    //properties
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
    
    //do not call on view will appear -- loads same photo
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
        //presents library
        let imagePicker = UIImagePickerController()
        //radio on
        imagePicker.delegate = self
        //picture editing == cropping
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        //shows library
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //getting user input and converting to ui image
        guard let original = info[.originalImage] as? UIImage else {return}
        //setting the imageview in the screen to the image
        imageView.image = original
        picker.dismiss(animated: true, completion: nil)
        //library view will disappear
    }
    
    //cancelled
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    //creates / updates
    @IBAction func saveButtonPressed(_ sender: Any) {
        //unwrapping for optionals
        guard let title = textFeild.text, let image = imageView.image, let data = image.pngData() else {
            //add error handling
            return
        }
        if let photoObject = photo {
            //updates if theres a photo in place
            photoController?.update(photo: photoObject, imageData: data, title: title)
            print("updated photo")
        } else {
            //creates if empty
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
            view.backgroundColor = .lightGray
            addButton.setTitleColor(.white, for: .normal)
        }
        
    }
}

