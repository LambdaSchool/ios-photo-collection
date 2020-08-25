//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Cody Morley on 8/3/20.
//  Copyright © 2020 Cody Morley. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UINavigationControllerDelegate {
    //MARK: - Properties -
    ///outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var addPhotoButton: UIButton!
    
    ///properties
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    var picker = UIImagePickerController()

    
    //MARK: - Life Cycles -
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        updateViews()
        picker.delegate = self
    }
    
    
    //MARK: - Actions -
    @IBAction func addPhotoTapped(_ sender: Any) {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        self.present(picker,
                     animated: true)
    }
    
    
    @IBAction func saveTapped(_ sender: Any) {
        if photo == nil, let pickedImage = imageView.image {
            let newPhoto = Photo(imageData: pickedImage.pngData()!, title: "")
            photo = newPhoto
        }
        
        guard let photo = photo else { return }
        
        guard let photoController = photoController,
            let text = self.titleField.text,
            !text.isEmpty,
            text != "" else {
                return
                
        }
        
        var photoMatches: Int = 0
        
        for savedPhoto in photoController.photos {
            if savedPhoto == photo {
                photoController.update(savedPhoto,
                                       with: photo.imageData,
                                       and: text)
                photoMatches += 1
            }
        }
        
        if photoMatches == 0 {
            photoController.photos.append(photo)
        }
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
    //MARK: - Methods -
    private func setTheme() {
        guard let themeHelper = themeHelper, let themePreference = themeHelper.themePreference else { return }
        
        switch themePreference {
        case themeHelper.darkValue:
            self.view.backgroundColor = UIColor.black
            titleField.textColor = UIColor.white
        case themeHelper.lambdaValue:
            self.view.backgroundColor = UIColor.white
            titleField.textColor = UIColor.red
        default:
            print("No theme data for detail view.")
        }
    }
    
    private func updateViews() {
        imageView.contentMode = .scaleAspectFit
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
        titleField.text = photo.title
    }
}


extension PhotoDetailViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.contentMode = .scaleAspectFit
            imageView.image = pickedImage
        }
        picker.dismiss(animated: true,
                       completion: nil)
    }
}
