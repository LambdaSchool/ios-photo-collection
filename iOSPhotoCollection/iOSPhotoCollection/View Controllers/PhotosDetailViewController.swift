//
//  PhotosDetailViewController.swift
//  iOSPhotoCollection
//
//  Created by Bhawnish Kumar on 2/27/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

import UIKit

class PhotosDetailViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var photoTextField: UITextField!
    
    
    var photoController: PhotoController?
    var photo: Photo?
    private var themeHelper: ThemeHelper?
    var imagePicker = UIImagePickerController()
    
  func setTheme() {
        guard let themePerference = themeHelper?.themePreference else { return }
        
        switch themePerference {
        case "Dark":
            view.backgroundColor = .darkGray
        case "Blue":
            view.backgroundColor = UIColor(red: 61/255, green: 172/255, blue: 247/255, alpha: 1)
        default:
            view.backgroundColor = .white
        }
    }
    
    func updateViews() {
    setTheme()
    guard let photo = photo else { return }
    photoImageView.image = UIImage(data: photo.image)
    photoTextField.text = photo.title
      }
 
    
    
    override func viewDidLoad() {
        setTheme()
        guard let photo = photo else { return }
        photoImageView.image = UIImage(data: photo.image)
        photoTextField.text = photo.title
        updateViews()
        imagePicker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func savePhoto(_ sender: Any) {
        if let photo = photo,
            let photoTitle = photoTextField.text,
            !photoTitle.isEmpty,
            let Photoimage = photoImageView.image {
            photoController?.updatePhoto(photo: photo, data: photo.image , title: title!)
        } else if let photoTitle = photoTextField.text,
            !photoTitle.isEmpty,
            let Photoimage = photoImageView.image {
            photoController?.updatePhoto(photo: photo!, data: photo!.image, title: title!)
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    
}

extension PhotosDetailViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let Photoimage = info[.originalImage] as? UIImage {
            photoImageView.image = Photoimage
        }
        picker.dismiss(animated: true, completion: nil)
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



