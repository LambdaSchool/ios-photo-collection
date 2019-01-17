//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Moses Robinson on 1/16/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    @IBAction func addPhoto(_ sender: Any) {
      let imagePicker = UIImagePickerController()
        
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        if let photo = photo {
            photoController?.updatePhoto(photo: <#T##Photo#>, imageData: <#T##Data#>, title: <#T##String#>)
        }
        
    }
    
    private func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        
        if themePreference == "Dark" {
            view.backgroundColor = #colorLiteral(red: 0.6466435194, green: 0.6634457111, blue: 0.7351312041, alpha: 1)
        } else if themePreference == "Purple" {
            view.backgroundColor = #colorLiteral(red: 0.5076087117, green: 0.5245476365, blue: 0.9441453815, alpha: 1)
        }
    }
    
    private func updateViews() {
        setTheme()
        guard let photo = photo else { return }
        
        photoImage.image = UIImage(data: photo.imageData)
        photoNameText.text = photo.title
    }
    
    //MARK: - Properties
    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var photoNameText: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
}
