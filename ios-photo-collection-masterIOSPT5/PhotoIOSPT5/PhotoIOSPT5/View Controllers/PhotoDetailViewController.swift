//
//  PhotoDetailViewController.swift
//  PhotoIOSPT5
//
//  Created by David Williams on 2/19/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var photoNameField: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        
        // Do any additional setup after loading the view.
        updateViews()
    }
    
    
    func updateViews() {
        setTheme()
        guard let photo = photo else { return }
        imageView.image =  UIImage(data: photo.imageData)
        photoNameField.text = photo.title
    }
    
    func setTheme() {
        guard let theme = themeHelper?.themePreference else { return }
           print("In PhotoDetailView")
           switch theme {
           case "Dark":
               print("switched theme to Dark")
               view.backgroundColor = .darkGray
           case "Green":
               print("switch theme to Green")
               view.backgroundColor = .systemGreen
           default:
               break
           }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
   
    @IBAction func addPhotoButtonTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func savePhotoTapped(_ sender: Any) {
        guard let image = imageView.image,
            let imageData = image.pngData(),
            let title = photoNameField.text else { return }
        if let photo = photo {
            photoController?.update(photo: photo, imageData: imageData, title: title)
        } else {
            photoController?.createPhoto(with: title, imageData: imageData)
            
        }
        navigationController?.popViewController(animated: true)
    }
}
