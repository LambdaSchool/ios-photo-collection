//
//  PhotoDetailViewController.swift
//  photoCollection
//
//  Created by beth on 1/30/20.
//  Copyright © 2020 elizabeth wingate. All rights reserved.
//

import UIKit

//part4 step 1
class PhotoDetailViewController: UIViewController {
    
    //part4 step 2
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var addPhotoImageView: UIImageView!
    @IBOutlet weak var addTitleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

        // Do any additional setup after loading the view.
    }
    
    func updateViews() {
        setTheme()
        guard let imageData = photo?.imageData else { return
        }
        addPhotoImageView.image = UIImage(data: imageData)
        addTitleTextField.text = photo?.title
    }
    
    @IBAction func addPhoto(_ sender: Any) { let imagePicker = UIImagePickerController()
    imagePicker.delegate = self

    let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    let cancelAlert = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    alertController.addAction(cancelAlert)

    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
        let photoLibrary = UIAlertAction(title: "Photo Library", style: .default, handler: {
            (_) in imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        })
        alertController.addAction(photoLibrary)
    }
    present(alertController,animated: true, completion: nil)
    }
    
    
    @IBAction func savePhoto(_ sender: Any) { guard let title = addTitleTextField.text, let data = addPhotoImageView.image?.pngData() else { return }
                if let photo = photo {
                    photoController?.updatePhoto(photo: photo, data: data, title: title)
                } else {
                    photoController?.createPhoto(data: data, title: title)
                }
                navigationController?.popViewController(animated: true)
        
    }
    
    func setTheme() {
        guard let themePreference = themeHelper?.themePreferenceKey else { return }
        switch themePreference {
        case ThemeHelper.PropertyKeys.dark:
            view.backgroundColor = .darkGray
        case ThemeHelper.PropertyKeys.white:
            view.backgroundColor =
            .white
        default:
            view.backgroundColor = .white
        }
    }
}
