//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Isaac Lyons on 9/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    //MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    
    //MARK: Properties
    
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
        guard let theme = themeHelper?.themePerference else { return }
        switch theme {
        case "Dark":
            view.backgroundColor = UIColor(hue: 0/360, saturation: 0/100, brightness: 30/100, alpha: 1.0)
        case "Orange":
            view.backgroundColor = UIColor(hue: 29/360, saturation: 42/100, brightness: 100/100, alpha: 1.0)
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
    
    @IBAction func addPhoto(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
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
