//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Joel Groomer on 8/15/19.
//  Copyright © 2019 Julltron. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    @IBOutlet weak var imgPhoto: UIImageView!
    @IBOutlet weak var txtTitle: UITextField!
    
    var photoController: PhotoController?
    var themeHelper: ThemeHelper?
    var photo: Photo?
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        picker.delegate = self
    }
    
    @IBAction func addPhotoTapped(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary),
           let mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary) {
            picker.sourceType = .photoLibrary
            picker.mediaTypes = mediaTypes
            present(picker, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func savePhotoTapped(_ sender: Any) {
        guard let photoController = photoController,
              let imgPhoto = imgPhoto
        else { return }
        
        if let photo = photo {
            if let imgData = imgPhoto.image?.pngData(),
               let title = txtTitle.text,
               !title.isEmpty {
                photoController.update(photo: photo, newData: imgData, newTitle: title)
            }
        } else {
            if let imgData = imgPhoto.image?.pngData(),
               let title = txtTitle.text,
                !title.isEmpty {
                photoController.create(data: imgData, title: title)
            }
        }
        navigationController?.popViewController(animated: true)
    }
    
    func setTheme() {
        guard let themeHelper = themeHelper,
              let theme = themeHelper.themePreference
        else { return }
        
        switch theme {
        case "Blue":
            view.backgroundColor = .blue
        case "Dark":
            view.backgroundColor = .lightGray
        default:
            view.backgroundColor = .white
        }
    }
    
    func updateViews() {
        setTheme()
        guard let photo = photo else { return }
        imgPhoto.image = UIImage(data: photo.imageData)
    }
}

extension PhotoDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        imgPhoto.contentMode = .scaleAspectFit
        imgPhoto.image = image
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
