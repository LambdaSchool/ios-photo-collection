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
            guard let imageData = imageView.image else { return }
            photoController?.create(textField.text ?? "", imageData)
            #warning("we stopped here for the night")
        }
    }
    
    @IBAction func addPhotoTapped(_ sender: Any) {
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
