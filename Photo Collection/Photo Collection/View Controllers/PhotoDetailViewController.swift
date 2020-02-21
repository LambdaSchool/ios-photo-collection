//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Juan M Mariscal on 2/20/20.
//  Copyright © 2020 Juan M Mariscal. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    @IBOutlet weak var photoDetailView: UIImageView!
    @IBOutlet weak var photoDetailTextField: UITextField!
    

    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func setTheme() {
        guard let themeHelper = themeHelper else { return }
        if let themePreference = themeHelper.themePreference {
            if themePreference == "Dark" {
                view.backgroundColor = UIColor.darkGray
            } else if themePreference == "Blue" {
                view.backgroundColor = UIColor.cyan
            }
        }
    }
    
    func updateViews() {
        setTheme()
        
        guard let photo = photo else { return }
        photoDetailView.image = UIImage(data: photo.imageData)
        photoDetailTextField.text = photo.title
    }
    
    @IBAction func addPhotoBtnTapped(_ sender: Any) {
        let photoPicker = UIImagePickerController()
    }
    
    @IBAction func savePhotoBtnTapped(_ sender: Any) {
        
        
    }
    
}
