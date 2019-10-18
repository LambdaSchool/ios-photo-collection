//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Jon Bash on 2019-10-17.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    var delegate: PhotosCollectionViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateViews()
    }
    
    // MARK: - Methods
    
    func updateViews() {
        if let themeHelper = themeHelper {
            themeHelper.setTheme(for: view)
        }
        
        if let photo = photo {
            imageView.image = UIImage(data: photo.imageData)
            navigationItem.title = photo.title
        }
    }

    // MARK: - IB Actions
    
    @IBAction func addPhotoTapped(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        picker.delegate = self
        navigationController?.present(picker, animated: true, completion: nil)
    }
    
    @IBAction func savePhotoTapped(_ sender: UIBarButtonItem) {
        guard let image = imageView.image,
            let imageData = image.jpegData(compressionQuality: 1.0),
            let title = textField.text
            else { return }
        
        if let photo = photo {
            photoController?.update(photo: photo, data: imageData, title: title)
        } else {
            photoController?.createPhoto(imageData: imageData, title: title)
        }
        
        if let photoController = photoController {
            for photo in photoController.photos {
                print("photo \(photo)")
            }
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        imageView.contentMode = .scaleAspectFit
        imageView.image = chosenImage
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

