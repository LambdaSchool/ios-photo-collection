//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Jesse Ruiz on 9/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var photoDetailImage: UIImageView!
    @IBOutlet weak var photoDetailTextField: UITextField!
    
    // MARK: - Properties
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    // MARK: - Methods
    func setTheme() {
        guard let currentTheme = themeHelper?.themePreference else { return }
        if currentTheme == "Dark" {
            view.backgroundColor = UIColor.darkGray
        } else {
            view.backgroundColor = UIColor.magenta
        }
    }
    
    func updateViews() {
        setTheme()
        guard let photo = photo else { return }
        photoDetailImage.image = UIImage(data: photo.imageData)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - Actions
    @IBAction func addPhoto(_ sender: UIButton) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        photoDetailImage.image = image
    }
    
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
        guard let newImage = photoDetailImage.image,
            let pngImage = newImage.pngData(),
            let newTitle = photoDetailTextField.text else { return }
        if let photo = photo {
            photoController?.update(photo: photo, data: pngImage, string: newTitle)
        } else {
            photoController?.create(image: pngImage, title: newTitle)
        }
        navigationController?.popToRootViewController(animated: true)
    }
    

}






