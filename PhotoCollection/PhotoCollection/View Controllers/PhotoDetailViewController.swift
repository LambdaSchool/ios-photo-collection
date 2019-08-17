//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Jessie Ann Griffin on 8/14/19.
//  Copyright © 2019 Jessie Griffin. All rights reserved.
//

import UIKit

protocol CreatePhotoDelegate {
    func photoWasCreated(_ photo: Photo)
}

class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var detailTextField: UITextField!
    
    var photoComtroller: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    var delegate: CreatePhotoDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        
        guard let photoImage = photoImageView.image,
            let detailText = detailTextField.text,
            !detailText.isEmpty else { return }
        
        //var photo = Photo(imageData: Data(photoImage), title: detailText)
        //delegate?.photoWasCreated(photo)
        self.navigationController?.popViewController(animated: true)
    }
    
    func setTheme() {
        guard let themeHelp = themeHelper else { return }
        guard let theme = themeHelp.themePreference else { return }
        
        if theme == "Dark" {
            view.backgroundColor = .darkGray
        } else if theme == "Sapphire" {
            view.backgroundColor = .cyan
        }
    }
    
    private func updateViews() {
        setTheme()
        
        guard let photoImage = photoImageView.image,
            let detailText = detailTextField.text,
            !detailText.isEmpty else { return }
        
        
        
    }
    
}

extension PhotoDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBAction func addPhoto(_ sender: UIButton) {
        let photo = UIImagePickerController()
        photo.delegate = self
        photo.sourceType = UIImagePickerController.SourceType.photoLibrary
        photo.allowsEditing = true
        self.present(photo, animated: true) {
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            photoImageView.image = image
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
