//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Dennis Rudolph on 10/17/19.
//  Copyright © 2019 LambdaSchool. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    @IBOutlet weak var detailPhotoImage: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    
    var photoController: PhotoController?
    
    var photo: Photo?
    
    var themeHelper: ThemeHelper?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func addPhotoTapped(sender: UIButton!) {
        
    }
    
    @IBAction func saveTapped(sender: UIBarButtonItem!) {
        if let photo = photo {
            guard let realImageData = detailPhotoImage.image?.pngData(),
            let realTitle = titleTextField.text else { return }
            
            photoController?.update(photo: photo, imageData: realImageData, title: realTitle)
        } else {
            guard let realImageData = detailPhotoImage.image?.pngData(),
                let realTitle = titleTextField.text else { return }
            
            photoController?.create(imageData: realImageData, title: realTitle)
        }
         navigationController?.popViewController(animated: true)
    }
    
    func setTheme() {
        guard let themeHelper = themeHelper else { return }
        let pref = themeHelper.themePreference
        if pref == "Blue" {
             themeHelper.setThemePreferenceToBlue()
             self.view.backgroundColor = .blue
        } else if pref == "Dark" {
             themeHelper.setThemePreferenceToDark()
             self.view.backgroundColor = .lightGray
        }
    }
    
    func updateViews() {
        setTheme()
        if let photo = photo {
            detailPhotoImage.image = UIImage(data: photo.imageData)
            titleTextField.text = photo.title
        }
    }
}
