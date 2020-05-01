//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Rob Vance on 4/29/20.
//  Copyright © 2020 Robs Creations. All rights reserved.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController {
    
    // Mark: IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageTitleTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        
    }
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    func setTheme() {
        guard let themeHelper = themeHelper else { return }
        if let themePreference = themeHelper.themePreference {
            if themePreference == "Dark" {
                view.backgroundColor = UIColor.darkGray
            } else if themePreference == "Green" {
                view.backgroundColor = UIColor.green
            }
        }
    }
    func updateViews() {
        setTheme()
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
        imageTitleTextField.text = photo.title
    }
    // Mark: IBAction
    @IBAction func addPhotoTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        let authStatus = PHPhotoLibrary.authorizationStatus()
        switch authStatus {
        case .authorized:
            guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            present(imagePicker, animated: true, completion: nil)
        case .denied:
            print("Access Denied")
        case.notDetermined:
            guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            present(imagePicker, animated: true, completion: nil)
        default:
            break
        }
    }
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let photoController = photoController,
            let image = imageView.image,
            let imageTitle = imageTitleTextField.text,
            let imageData = image.pngData(),
            !imageTitle.isEmpty else { return }
        if let photo = photo {
            photoController.updatePhoto(photo: photo, imageData: imageData, imageTitle: imageTitle)
        } else {
            photoController.createPhoto(imageData: imageData, title: imageTitle)
        }
        self.navigationController?.popViewController(animated: true)
    }
}

extension PhotoDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    picker.dismiss(animated: true)
    guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
    imageView.image = image
    }
}
