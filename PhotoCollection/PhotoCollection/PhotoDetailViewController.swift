//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Enrique Gongora on 1/30/20.
//  Copyright © 2020 Enrique Gongora. All rights reserved.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{

    //MARK: - Outlets/Variables
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    
    //MARK: - Actions
    @IBAction func addPhotoPressed(_ sender: UIButton) {
        let picker = UIImagePickerController()
        let authorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch authorizationStatus {
        case .authorized:
            guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
            picker.sourceType = .photoLibrary
            picker.delegate = self
            present(picker, animated: true, completion: nil)
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { (status) in
                guard status == .authorized else{
                    NSLog("User did not authorize access to photo library"); return
                }
            }
        default:
            break
        }
    }
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        guard let data = photoImageView.image?.pngData(), let title = titleTextField.text else { return }
        if let photo = photo{
            photoController?.update(photo: photo, data: data, string: title)
        }else{
            photoController?.create(imageData: data, title: title)
        }
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Functions
    func setTheme() {
        guard let themeHelper = themeHelper else { return }
        if themeHelper.themePreference == "Dark"{
            view.backgroundColor = .darkGray
        }else{
            view.backgroundColor = .cyan
        }
    }
    
    func updateViews(){
        setTheme()
        guard let photo = photo else { return }
        photoImageView.image = UIImage(data: photo.imageData)
        titleTextField.text = photo.title
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {
            print("No Image found")
            return }
        photoImageView.image = image
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        self.title = "Create Photo"
    }
}
