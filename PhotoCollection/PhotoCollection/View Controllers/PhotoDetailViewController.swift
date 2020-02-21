//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Elizabeth Thomas on 2/20/20.
//  Copyright © 2020 Libby Thomas. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    // MARK: - IBOutlets
    @IBOutlet weak var photoDetailImageView: UIImageView!
    @IBOutlet weak var photoTitleTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        updateViews()
    }
    
    // MARK: - IBActions
    @IBAction func addPhoto(_ sender: Any) {
//        var imagePickerController = UIImagePickerController
//        UIImagePickerController.SourceType.photoLibrary
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        if photo != nil {
            updateViews()
        } else {
            photoController?.createPhoto(imageData: <#T##Data#>, title: <#T##String#>)
            self.navigationController?.popToRootViewController(animated: true)
        }
        
    }
    
    func setTheme() {
        guard themeHelper?.themePreference == nil else { return }
        if themeHelper?.themePreference == "Dark" {
            self.view.backgroundColor = .darkGray
        } else if themeHelper?.themePreference == "Green" {
            self.view.backgroundColor = .green
        }
    }
    
    func updateViews() {
        guard let photo = photo else { return }
        
        photoDetailImageView.image = UIImage(data: photo.imageData)
        photoTitleTextField.text = photo.title
    }
  
}

extension PhotoDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
}
