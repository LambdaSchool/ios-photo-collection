//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Alex Ladines on 5/2/19.
//  Copyright © 2019 Alex Perse. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    // MARK: - Properties
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    // MARK: - IBOutlet
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    // MARK: - IBAction
    @IBAction func addPhotoButtonPressed(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        present(imagePicker,animated: true,completion: nil)
        imagePicker.delegate = self
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        guard let availableData = self.photoImageView.image?.pngData(),
        let title = titleTextField.text else { return }
        
        // If user is editing an existing photo
        if let photo = self.photo
        {
            self.photoController?.update(photo: photo, imageData: availableData, title: title)
        }
        // User is adding a new photo
        else
        {
            self.photoController?.createPhoto(imageData: availableData, title: title)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateViews()
    }
    
    // MARK: - Methods
    func setTheme() {
        // Get curent theme
        guard let currentThemeHelper = self.themeHelper?.themePreference else { return }
    
        self.view.backgroundColor = (currentThemeHelper == String.dark) ? UIColor.darkGray: UIColor.blue
    }
    
    func updateViews() {
        self.setTheme()
        
        guard let photo = self.photo else { return }
        self.photoImageView.image = UIImage(data: photo.imageData)
        self.titleTextField.text = photo.title
        
    }
    

}
// MARK: - UIImagePickerControllerDelegate
extension PhotoDetailViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        self.photoImageView.image = image
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UINavigationControllerDelegate
extension PhotoDetailViewController: UINavigationControllerDelegate {
    
}
