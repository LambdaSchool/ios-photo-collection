//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Ciara Beitel on 8/22/19.
//  Copyright © 2019 Joshua Sharp. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func saveTapped(_ sender: Any) {
        if let photo = photo {
            photoController?.update(photo, image: photo.imageData, title: textField.text ?? "")
        } else {
            guard let imageData = imageView.image else { return }
            photoController?.create(textField.text ?? "", imageData)
        }
    }
    
    @IBAction func addPhotoTapped(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        present (imagePicker, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        if let themeHelper = themeHelper {
            themeHelper.setTheme(view: view)
        }
        guard let photo = photo else { return }
        textField.text = photo.title
        imageView.image = photo.imageData
    }
    

}

extension PhotoDetailViewController: UIImagePickerControllerDelegate {
    
}
