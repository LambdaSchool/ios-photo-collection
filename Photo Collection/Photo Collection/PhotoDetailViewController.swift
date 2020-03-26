//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Harmony Radley on 3/26/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    var photoController : PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addtitleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        updateViews()
    }
    
    @IBAction func addPhoto(_ sender: Any) {
    }
    
    
    @IBAction func savePhoto(_ sender: Any) {
        guard let image = imageView.image,
            let imageData = image.pngData(),
            let title = addtitleTextField.text else { return }
        
        
        if let photo = photo {
            photoController?.update(photo: photo, imageData: imageData, title: title)
        } else {
            photoController?.createPhoto(imageData: imageData, title: title)
        }
        
        navigationController?.popViewController(animated: true)
        
    }
    
    private func updateViews() {
           
           guard let photo = photo else {
               title = "Create Photo"
               return
           }
           
           title = photo.title
           
           imageView.image = UIImage(data: photo.imageData)
           addtitleTextField.text = photo.title
       }
    
    private func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        
        var backgroundColor: UIColor!
        
        switch themePreference {
        case "Dark":
            backgroundColor = .lightGray
        case "Blue":
            backgroundColor = UIColor(red: 61/255, green: 172/255, blue: 247/255, alpha: 1)
        default:
            break
        }
        
        view.backgroundColor = backgroundColor
    }

}
