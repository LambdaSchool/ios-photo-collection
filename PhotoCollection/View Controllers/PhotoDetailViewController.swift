//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Scott Bennett on 9/13/18.
//  Copyright © 2018 Scott Bennett. All rights reserved.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()

    }
    
    private func updateViews() {
        setTheme()
        guard let photo = photo else {
            title = "Create Photo"
            return }
        title = ""
        imageView.image = UIImage(data: photo.imageData)
        textView.text = photo.title
        
        
    }
    
    func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        
        switch themePreference {
        case "Dark":
            view.backgroundColor = .darkGray
        default:
            view.backgroundColor = .lightGray
        }
        
        
    }
    

    @IBAction func addPhoto(_ sender: Any) {
        PHPhotoLibrary.requestAuthorization { (status) in
            guard status == .authorized else {
                NSLog("Please go into setting adn allwo access to photos for SimplePhoto.")
                return }
            
            DispatchQueue.main.async {
                self.presentImagePickerController()
            }
        }
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        guard let title = textView.text,
            let image = imageView.image,
            let imageData = UIImagePNGRepresentation(image) else { return }
        
        if let photo = photo {
            photoController?.update(with: photo, title: title, imageData: imageData)
        } else {
            photoController?.create(withName: title, imagedata: imageData)
        }
        navigationController?.popViewController(animated: true)
    }


    private func presentImagePickerController() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    // MARK: - UIImagePicker
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }
        imageView.image = image
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
    }
}
