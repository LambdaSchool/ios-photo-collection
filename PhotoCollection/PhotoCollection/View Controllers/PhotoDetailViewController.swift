//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Gi Pyo Kim on 9/19/19.
//  Copyright © 2019 GIPGIP Studio. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UINavigationControllerDelegate {
    // MARK: Properties
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var navigationTitle: UINavigationItem!
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
//    // MARK: Methods
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//        updateViews()
//    }
    
    func setTheme() {
        guard let themeHelper = themeHelper, let themePreference = themeHelper.themePreference else { return }
        
        switch themePreference {
        case "Dark":
            view.backgroundColor = UIColor.gray
        case "Random":
            view.backgroundColor = themeHelper.randomColor
        default:
            print("Invalid themePreference")
            return
        }
    }
    
    func updateViews() {
        setTheme()
        if let photo = photo {
            photoImageView.image = UIImage(data: photo.imageData)
            photoTextField.text = photo.title
        }
    }

    @IBAction func addPhotoTabbed(_ sender: UIButton) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true)
    }
    
    @IBAction func saveTabbed(_ sender: UIBarButtonItem) {
        if let photo = photo,
            let photoController = photoController,
            let imageData = photoImageView.image?.pngData(),
            let title = photoTextField.text,
            !title.isEmpty {
                photoController.update(photo: photo, imageData: imageData, title: title)
                navigationController?.popViewController(animated: true)
        } else if photo == nil,
            let photoController = photoController,
            let imageData = photoImageView.image?.pngData(),
            let title = photoTextField.text,
            !title.isEmpty {
            photoController.create(imageData: imageData, title: title)
            navigationController?.popViewController(animated: true)
        }
    }
}

extension PhotoDetailViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        picker.dismiss(animated: true)
        photoImageView.image = image
    }
}
