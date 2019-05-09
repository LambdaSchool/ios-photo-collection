//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Jeremy Taylor on 5/9/19.
//  Copyright © 2019 Bytes-Random L.L.C. All rights reserved.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    

    @IBAction func addPhoto(_ sender: Any) {
        let authorizationStatus = PHPhotoLibrary.authorizationStatus()
        
        switch authorizationStatus {
        case .authorized:
            presentImagePickerController()
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status {
                case .authorized:
                    self.presentImagePickerController()
                    
                default:
                    break
                }
            }
        default:
            break
        }
    }
   
    @IBAction func savePhoto(_ sender: Any) {
        guard let photo = photo else {
            // We're saving a new photo
            
            guard let text = nameTextField.text,
                let image = photoImageView.image else { return}
            
            guard let imageData = image.pngData() else { return }
            
            photoController?.createPhoto(with: imageData, with: text)
            navigationController?.popViewController(animated: true)
            return
        }
        
        // We're updating a photo
        
        guard let text = nameTextField.text,
            let image = photoImageView.image else { return}
        
        guard let imageData = image.pngData() else { return }
        
        photoController?.updatePhoto(photo: photo, imageData: imageData, title: text)
    }
    
    func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        
        if themePreference == "Dark" {
            view.backgroundColor = UIColor.lightGray
        } else {
            view.backgroundColor = UIColor.green
        }
    }
    
    private func updateViews() {
        guard let photo = photo else { return }
        
        let image = UIImage(data: photo.imageData)
        photoImageView.image = image
        nameTextField.text = photo.title
    }
    
    func presentImagePickerController() {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
        let pickerController = UIImagePickerController()
        pickerController.sourceType = .photoLibrary
        pickerController.delegate = self
        
        present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[.originalImage] as? UIImage else { return }
        photoImageView.image = image
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

