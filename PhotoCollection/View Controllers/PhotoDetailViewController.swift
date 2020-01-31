//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Chris Gonzales on 1/30/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var photoDetailText: UITextField!
    
    @IBAction func addPhoto(_ sender: Any) {
        let authorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch authorizationStatus{
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { (status) in
                guard status == .authorized else { NSLog("User did not authorize access to the photo library"); return }
                self.photoLibrary()
                
            }
        case .authorized:
            photoLibrary()
        default:
            break
        }
        
    }
    
    
    func photoLibrary(){
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {return}
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = .photoLibrary
        present(myPickerController, animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        guard let photo = photo else {return}
        photoImage.image = UIImage(data: photo.imgageDate)
        photoController?.createPhoto(photo: photo)
        
    }
    
    func setTheme(){
        
        guard let preference = themeHelper else {return}
        
        guard let unwrappedPreference = preference.themePreference else {return}
        
        if unwrappedPreference == "Dark"{
            view.backgroundColor = .gray
        } else{
            view.backgroundColor = .green
        }
        updateViews()
    }
    
    func updateViews(){
        guard let photo = photo else {return}
        photoImage.image = UIImage(data: photo.imgageDate)
        photoDetailText.text = photo.title
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
}

extension PhotoDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[uip] as? UIImage else { return UIImage()}
        
        
    }
}
