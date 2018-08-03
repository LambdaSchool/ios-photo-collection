//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Carolyn Lea on 8/2/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var addPhotoButton: UIButton!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper = ThemeHelper()
    var dataOfImage: Data?
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        setTheme()
        updateViews()
    }
    
    @IBAction func savePhoto(_ sender: Any)
    {
        if photo == nil
        {
            guard let title = titleTextField.text,
                let imageData = dataOfImage else {return}
            
            photoController?.createPhoto(imageData: imageData, title: title)
        }
        else
        {
            guard let title = titleTextField.text,
                let chosenImage = detailImageView.image,
                let imageData = UIImagePNGRepresentation(chosenImage) else {return}
            
            photoController?.updatePhoto(photo: photo!, imageData: imageData, title: title)
        }
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - ImagePicker
    
    func checkPhotoPermission()
    {
        PHPhotoLibrary.requestAuthorization { (status) in
            
            let status = PHPhotoLibrary.authorizationStatus()
            switch status {
            case .authorized:
                print("authorized")
            case .notDetermined:
                PHPhotoLibrary.requestAuthorization() { status in
                    if status == .authorized {
                        DispatchQueue.main.async {
                            self.presentImagePickerController()
                        }
                    }
                }
            case .restricted:
                // do nothing
                break
            case .denied:
                // do nothing, or beg the user to authorize us in Settings
                break
            }
        }
    }
    
    @IBAction func addPhoto(_ sender: Any)
    {
        checkPhotoPermission()
        PHPhotoLibrary.requestAuthorization { (status) in
            guard status == .authorized else {
                NSLog("go to settings to allow acces")
                return
            }
            print("photo acces authorized")
            DispatchQueue.main.async {
                self.presentImagePickerController()
            }
        }
    }
    
    private func presentImagePickerController()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary)
        {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            imagePicker.delegate = self
            
            present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            print("photo library not available")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        picker.dismiss(animated: true, completion: nil)
        
        guard let chosenImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {return}
        detailImageView.contentMode = .scaleAspectFit
        detailImageView.image = chosenImage
        
        if let data = UIImagePNGRepresentation(chosenImage)
        {
            dataOfImage = data
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        picker.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Update
    
    func updateViews()
    {
        guard let photo = photo else {
            title = "Add Photo"
            return
        }
        title = "Edit Photo"
        
        titleTextField.text = photo.title
        detailImageView.image = UIImage(data: photo.imageData)
        
    }
    
    func setTheme()
    {
        guard let currentTheme = themeHelper.themePreference else {return}
        if currentTheme == "Dark"
        {
            self.view?.backgroundColor = UIColor.darkGray
        }
        else if currentTheme == "Pink"
        {
            self.view?.backgroundColor = UIColor.magenta
        }
    }
}
