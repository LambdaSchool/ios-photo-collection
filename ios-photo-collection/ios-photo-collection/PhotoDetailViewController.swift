				//
//  PhotoDetailViewController.swift
//  ios-photo-collection
//
//  Created by Benjamin Hakes on 11/28/18.
//  Copyright © 2018 Benjamin Hakes. All rights reserved.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var photoTitleTextField: UITextField!
    
    @IBAction func addPhoto(_ sender: Any) {
        let authorizationStatus = PHPhotoLibrary.authorizationStatus()
        if authorizationStatus == .authorized {
            presentImagePickerController()
        } else if authorizationStatus == .notDetermined {
            PHPhotoLibrary.requestAuthorization { (authorizationStatus) in
                if authorizationStatus == .authorized {
                    self.presentImagePickerController()
                }
            }
        } else if authorizationStatus == .denied {
            let alert = UIAlertController(title: "Photo Collection can't access your photo library", message: "Please allow photo library access to be able to add photos to your photo collection.", preferredStyle: .alert)
            
            let goToAction = UIAlertAction(title: "Show Settings", style: .default) { (action) in
                if let url = URL(string: "app-settings:") {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in }
            
            alert.addAction(goToAction)
            alert.addAction(cancel)
            
            present(alert, animated: true, completion: nil)
        }
        
    }
    @IBAction func savePhoto(_ sender: Any) {
        guard let photoController = photoController else {return}
        
        guard let photoTitle = photoTitleTextField.text, let image = imageView.image, let imageData = image.pngData() else {return}
       
        
        guard let photo = photo else {
            photoController.create(imageData, photoTitle)
            navigationController?.popToRootViewController(animated: true)
            return
        }
        
        photoController.update(for: photo, imageData, photoTitle)
        navigationController?.popToRootViewController(animated: true)
    }


    func presentImagePickerController(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            present(imagePicker, animated: true, completion: nil)
        } else { return }
    }
    
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        // don't understand this:
        //        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        //        imageView.image = image
    }
    
    func setTheme(){
        guard let currentTheme = themeHelper?.themePerference else {return}
        switch currentTheme{
        case "Dark":
            view.backgroundColor = .black
        case "Blue":
            view.backgroundColor = .blue
        default:
            view.backgroundColor = .black
        }
    }
    
    func updateViews(){
        setTheme()
        
        guard let photo = photo else {return}
        let image = UIImage(data: photo.imageData)
        imageView.image =  image
        photoTitleTextField.text = photo.title
        
        
    }

}
