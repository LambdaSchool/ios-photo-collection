//
//  PhotoDetailViewController.swift
//  photoviewer
//
//  Created by Ian French on 4/30/20.
//  Copyright © 2020 Ian French. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

 
    
    
    @IBOutlet weak var detailImage: UIImageView!
    
    

    @IBOutlet weak var detailTextField: UITextField!
    
    
    @IBAction func addPhoto(_ sender: UIButton) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = false
        
        present(imagePicker, animated: true, completion:  nil)
        
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        
        guard let text = detailTextField.text,
            let imageData = detailImage.image?.pngData() else { return  }
        
        if let photo = photo {
            photoController?.updatePhoto(for: photo, with: imageData, and: text)
        } else {
            photoController?.createPhoto(imageData: imageData, title: text)
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    

    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    
    
    
    
      func setTheme() {
         guard let theme = themeHelper?.themePreference else { return }
         
         switch theme {
         case "Green":
            view.backgroundColor = UIColor.green
         default:
              view.backgroundColor = UIColor.darkGray
     
             
         }
     }
    
    
    func updateViews() {
        setTheme()
        
        if let photo = photo {
            detailImage.image = UIImage(data: photo.imageData)
            detailTextField.text = photo.title
        }
    }
    
}

