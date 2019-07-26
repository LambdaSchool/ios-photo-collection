//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Alex Rhodes on 7/25/19.
//  Copyright © 2019 Blake Andrew Price. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var photoDescriptionTextField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

    }
    
    @IBAction func addPhotoButtonPressed(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        guard let title = photoDescriptionTextField.text, let imageData = imageView.image?.pngData() else {return}
        
        
        if photo == nil {
            
            updateViews()
            navigationController?.popViewController(animated: true)
            
        } else {

            photoController?.create(imageData: imageData, title: title)
            navigationController?.popViewController(animated: true)
            
        }
    }
    
    func setTheme() {
        guard let themeChosen = themeHelper?.themePreference else {return}
        
        if themeChosen == "Dark" {
            view.backgroundColor = UIColor.darkGray
        } else {
            view.backgroundColor = UIColor.white
        }
    }
    
    func updateViews() {
        setTheme()
        guard let photo = photo, let photoDescription = photoDescriptionTextField.text else { return }
        imageView.image = UIImage(data: photo.imageData)
        photoDescriptionTextField.text = photoDescription
    }

}

extension PhotoDetailViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard  let imageURL = info[.imageURL] as? URL else {return}
        
        guard   let data = try? Data.init(contentsOf: imageURL) else {return}
        imageView.image = UIImage(data: data)
        
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension PhotoDetailViewController: UINavigationControllerDelegate {}

