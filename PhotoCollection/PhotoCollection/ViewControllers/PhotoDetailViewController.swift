//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Cora Jacobson on 6/10/20.
//  Copyright © 2020 Cora Jacobson. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        updateViews()
    }
    
    func picker() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        self.present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func addPhotoButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Photo Collection would like to\naccess your photo library", message: nil, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .cancel, handler: { action in self.picker() })
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func savePhotoButton(_ sender: UIBarButtonItem) {
        if let title = titleTextField.text,
            let image = photoImageView.image?.pngData() {
            if let photo = photo {
                photoController?.updatePhoto(photo, image, title)
                navigationController?.popViewController(animated: true)
            } else {
                photoController?.createPhoto(image, title)
                navigationController?.popViewController(animated: true)
            }
        } else {
            let alert = UIAlertController(title: "Please add a photo and title", message: nil, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okButton)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func setTheme() {
        if let theme = themeHelper?.themePreference {
            switch theme {
            case "Dark":
                view.backgroundColor = .myDark
            default:
                view.backgroundColor = .myPurple
            }
        } else { return }
    }
    
    func updateViews() {
        if let photo = photo {
            titleTextField.text = photo.title
            photoImageView.image = UIImage(data: photo.imageData)
        }
    }
    
}

extension PhotoDetailViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        photoImageView.image = image
        dismiss(animated: true, completion: nil)
    }
}

extension PhotoDetailViewController: UINavigationControllerDelegate {
}
