//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by morse on 10/17/19.
//  Copyright © 2019 morse. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHepler: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertcontroller = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertcontroller.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: {
                (_) in imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertcontroller.addAction(photoLibraryAction)
        }
        
        present(alertcontroller, animated: true, completion: nil)
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        guard let name = textField.text, let data = imageView.image?.pngData() else { return }
        if let photo = photo {
            photoController?.update(photo: photo, named: name, with: data)
        } else {
            photoController?.createPhoto(named: name, with: data)
        }
        navigationController?.popViewController(animated: true)
    }
    
    private func setTheme() {
        guard let themePreference = themeHepler?.themePreference else { return }
        
        switch themePreference {
        case ThemeHelper.PropertyKeys.dark:
            view.backgroundColor = .darkGray
        default:
            view.backgroundColor = .purple
        }
    }
    
    private func updateViews() {
        setTheme()
        guard let imageData = photo?.imageData else { return }
        
        imageView.image = UIImage(data: imageData)
        textField.text = photo?.title
    }

}

extension PhotoDetailViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage, let data = image.pngData() else { return }
        
//        photo?.imageData = data
        imageView.image = image
        
        dismiss(animated: true, completion: self.updateViews)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
