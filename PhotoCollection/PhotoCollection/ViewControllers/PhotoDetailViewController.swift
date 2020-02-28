//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Shawn Gee on 2/27/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    
    //MARK: - Properties
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    
    //MARK: - IBOutlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    
    //MARK: - IBActions
    
    @IBAction func save(_ sender: Any) {
        guard let photoController = photoController,
              let imageData = imageView.image?.pngData(),
              var titleText = textField.text else { return }
        
        if titleText.isEmpty { titleText = "Untitled" }
        
        if let photo = photo {
            // Update Photo
            photoController.update(photo: photo, withData: imageData, title: titleText)
        } else {
            // Create Photo
            photoController.createPhoto(withData: imageData, title: titleText)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func selectPhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.mediaTypes = ["public.image"]
        present(imagePicker, animated: true)
    }
    
    
    
    //MARK: - Private
    
    private func setTheme() {
        guard let themeHelper = themeHelper else { return }
        
        let theme = themeHelper.themePreference
        view.backgroundColor = UIColor.init(named: theme)
    }
    
    private func upadateViews() {
        guard let photo = photo,
              let image = UIImage(data: photo.imageData) else { return }
        
        imageView.image = image
        textField.text = photo.title
    }
    
    
    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        upadateViews()
        setTheme()
    }
}


//MARK: - UIImagePickerControllerDelegate

extension PhotoDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        picker.dismiss(animated: true)
    }
}

