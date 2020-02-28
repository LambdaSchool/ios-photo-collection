//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Nichole Davidson on 2/27/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var addImage: UIImageView!
    @IBOutlet weak var addPhotoTitle: UITextField!
    
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        imagePicker.delegate = self

    }
    
    func setTheme() {
        if themeHelper?.themePreference == "Sienna" {
          self.view.backgroundColor = UIColor(red: 235, green: 100, blue: 100, alpha: 1)
      } else {
          self.view.backgroundColor = UIColor.darkGray
      }
    }
    
    func updateViews() {
        
        guard let newImage = photo?.imageData,
               let image = UIImage(data: newImage),
               let title = addPhotoTitle.text else { return }
               
               addImage.image = image
               addPhotoTitle.text = title
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
        
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        
        if photo?.imageData != nil {
                  updateViews()
              }
              navigationController?.popViewController(animated: true)

    }
    
    // MARK: - UIImagePickerControllerDelegate Methods
     
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            addImage.contentMode = .scaleAspectFit
            addImage.image = pickedImage
        }
     
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
