//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Iyin Raphael on 8/9/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit
import Photos
class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    var photo: Photo?
    var photoController: PhotoController?
    var themeHelper: ThemeHelper?
    
    func updateViews(){
        if let photo = photo {
            navigationItem.title = photo.title
            imageView.image = UIImage(data: photo.imageData)
            textField.text = photo.title
        }else{
            navigationItem.title = "Add Photo"
        }
    }
    
    func setTheme(){
        guard let themePref = themeHelper?.themePrefence else {return}
        view?.backgroundColor = UIColor(named: themePref)
    }
    
    @IBAction func save(_ sender: Any) {
        guard let title = textField.text,
            let imageData =  UIImagePNGRepresentation(imageView.image!) else {return}
        if let photo = photo{
            photoController?.updatePhoto(photo: photo, title: title, imageData: imageData)
        }else{
            photoController?.createPhoto(title: title, imageData: imageData)
        }
    }
    @IBAction func addPhoto(_ sender: Any) {
        PHPhotoLibrary.requestAuthorization { (permission) in
            if permission == .authorized {
                print("User granted us access")
                
                DispatchQueue.main.sync {
                    self.presentImgaeController()
                }
            }
        }
    }
    
    func presentImgaeController(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {return}
        imageView.image = image
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
}
