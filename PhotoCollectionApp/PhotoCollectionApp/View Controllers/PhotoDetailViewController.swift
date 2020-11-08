//
//  ViewController.swift
//  PhotoCollectionApp
//
//  Created by Nelson Gonzalez on 1/16/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var infoTextField: UITextField!
    
    
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateView()
    }

    @IBAction func addPhotoButtonPressed(_ sender: UIButton) {
        
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {return}
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true)
        
    }
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
    
        guard let title = infoTextField.text, !title.isEmpty, let image = photoImageView.image, let imageData = image.pngData() else { return}
        if let photo = photo {
            photoController?.update(photo: photo, data: imageData, string: title)
        } else {
        photoController?.createPhotos(with: imageData, and: title)
   
        }
        navigationController?.popViewController(animated: true)
         
    }
    
    private func updateView(){
        setTheme()
        
        guard let photo = photo else {return}
        
        let image = UIImage(data: photo.imageData)
        
        photoImageView.image = image
        infoTextField.text = photo.title
    }
    
    func setTheme(){
        guard let theme = themeHelper?.themePreference else {return}
        
        switch theme {
        case "Light":
            view.backgroundColor = .white
        case "Dark":
            view.backgroundColor = .darkGray
        default:
            break
        }
        
    }
    
}

extension PhotoDetailViewController {
    // MARK: - ImagePicker Controller
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        defer { picker.dismiss(animated: true)}
        guard let image = info[.originalImage] as? UIImage else {return}
        photoImageView.image = image
    }
}
