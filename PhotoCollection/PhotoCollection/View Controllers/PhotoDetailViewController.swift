//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Linh Bouniol on 8/2/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    var photo: Photo?
    var photoController: PhotoController?
    var themeHelper: ThemeHelper?

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var textField: UITextField!
    
    @IBAction func addPhoto(_ sender: Any) {
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        // Make sure everything exists
        guard let title = textField.text, let image = imageView.image, let imageData = UIImagePNGRepresentation(image) else { return }
        
        if let photo = photo {
            photoController?.update(photo: photo, title: title, imageData: imageData)
        } else {
            photoController?.createPhoto(withTitle: title, imageData: imageData)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }

    func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        
        if themePreference == "Red" {
            view.backgroundColor = UIColor.red
        } else {
            view.backgroundColor = UIColor.darkGray
        }
    }
    
    func updateViews() {
        if photo == nil {
            navigationItem.title = "Add Photo"
        } else {
            guard let photo = photo else { return }
            navigationItem.title = "Edit Photo"
            imageView?.image = UIImage(data: photo.imageData)
            textField?.text = photo.title
        }
    }
}
