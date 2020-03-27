//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Cameron Collins on 3/26/20.
//  Copyright © 2020 Cameron Collins. All rights reserved.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textFieldTitle: UITextField!
    
    //Variables
    var photoController: PhotoController? = nil
    var photo: Photo?
    var themeHelper: ThemeHelper?
    var imageHolder: UIImage?
    var delagate: PhotosCollectionViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTheme()
        updateViews()
    }
    
    
    //Actions
    @IBAction func buttonSavePhoto(_ sender: Any) {
        if let myImage = imageHolder?.pngData() {
            photoController?.createPhoto(myPhoto: Photo(imageData: myImage, title: textFieldTitle?.text ?? ""))
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    //Functions
    @IBAction func addImage(_ sender: Any) {
        let authorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch authorizationStatus {
        case .authorized:
            presentImagePickerController()
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { (status) in
                guard status == .authorized else { NSLog("User did not authorize access to the photo library"); return }
                self.presentImagePickerController()
            }
        default:
            break
        }
    }
    private func presentImagePickerController() {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    // MARK: - UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else { return }
        imageView.image = image
        imageHolder = image
    }
    
    private func updateViews() {
        guard let photo = photo else {
            title = "Create Photo"
            return
        }
        title = photo.title
        imageView.image = UIImage(data: photo.imageData)
        textFieldTitle.text = photo.title
    }
    
    func setTheme() {
        if let myTheme = themeHelper?.themePreference {
            
            switch myTheme {
                
            case Themes.dark.rawValue:
                view.backgroundColor = .black
                
            case Themes.blue.rawValue:
                view.backgroundColor = .blue
                
            default:
                break
                
            }
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

}
