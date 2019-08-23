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
            photoController?.update(photo, data: photo.imageData, title: textField.text ?? "")
        } else {
            guard let imageViewData = imageView.image else { return }
            guard let imageData = imageViewData.pngData() else { return }
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
    
    #warning("come back and add this to ThemeHelper")
    func setTheme() {
        guard let theme = themeHelper?.themePreference else { return }
        switch theme {
        case .blue:
            view.backgroundColor = .blue
        case .dark:
            view.backgroundColor = .darkGray
        case .light:
            view.backgroundColor = .white
        }
    }
    
    func updateViews() {
        setTheme()
        guard let photo = photo else { return }
        textField.text = photo.title
        imageView.image = UIImage(data: photo.imageData)
    }
    

}

extension PhotoDetailViewController: UIImagePickerControllerDelegate {
    
}
