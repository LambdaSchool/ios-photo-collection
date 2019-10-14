//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Alex Thompson on 10/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        setTheme()
        
        if let photo = photo {
            imageView.image = UIImage(data: photo.imageData)
            nameTextField.text = photo.title
        }
    }
    
    func setTheme() {
        guard let theme = themeHelper?.themePreference else { return }
        switch theme {
        case "Dark":
            view.backgroundColor = UIColor(hue: 0/360, saturation: 0/100, brightness: 30/100, alpha: 1.0)
        case "Red":
            view.backgroundColor = UIColor(hue: 8/360, saturation: 100/100, brightness: 99/100, alpha: 1.0)
        default:
            view.backgroundColor = .white
            
        }
    }
    
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let text = nameTextField.text,
            let imageData = imageView.image?.pngData() else { return }
        if let photo = photo {
            photoController?.updatePhoto(photo: photo, imageData: imageData, title: text)
        } else {
            photoController?.createPhoto(imageData: imageData, title: text)
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func addPhotoTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = false
        
        present(imagePicker, animated: true, completion: nil)
    }

}

extension PhotoDetailViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imageView.image = image
    }
}

extension PhotoDetailViewController: UINavigationControllerDelegate {}
