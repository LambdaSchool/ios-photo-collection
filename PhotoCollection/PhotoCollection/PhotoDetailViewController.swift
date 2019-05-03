//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Christopher Aronson on 5/2/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateViews()
    }
    
    @IBAction func addPhotoButtonPressed(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.mediaTypes = ["public.image"]
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.editedImage] as? UIImage else {return}
        imageView.image = image
    }
    
    @IBAction func saveItemPressed(_ sender: Any) {
        guard let title = textField.text else {
            print("Error: no title")
            return
        }
        guard let image = imageView.image else {
            print("Error: there is no image in the view.")
            return
        }
        guard let imageData = image.pngData() else {
            print("Error: image could not be converted to data")
            return
        }
        photoController?.createPhoto(data: imageData, title: title)
        navigationController?.popViewController(animated: true)
    }
    
    func updateViews() {
        setTheme()
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
        textField.text = photo.title
    }
    
    
    func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        switch themePreference {
        case "Dark":
            view.backgroundColor = #colorLiteral(red: 0.07058823529, green: 0.07058823529, blue: 0.07058823529, alpha: 1)
        case "Blue":
            view.backgroundColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        default :
            return
        }
    }
}

