//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Bradley Diroff on 2/27/20.
//  Copyright © 2020 Bradley Diroff. All rights reserved.
//

import UIKit

protocol AddPhotoDelegate {
func photoWasAdded(_ photo: Photo)
func photoWasUpdated(oldPhoto: Photo, title: String, imageData: Data)
}

class PhotoDetailViewController: UIViewController,  UINavigationControllerDelegate {
    
    @IBOutlet var detailImageView: UIImageView!
    @IBOutlet var detailTextField: UITextField!
    @IBOutlet var addPhotoButton: UIButton!
    
    
    var delegate: AddPhotoDelegate?
    
    var photoController: PhotoController?

    var themeHelper: ThemeHelper?

    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        updateViews()
        setTheme()
        addPhotoButton.layer.cornerRadius = 5
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
            
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        guard let theText = detailTextField?.text, let theImage = detailImageView?.image, let dataImage = theImage.pngData() else {return}
        if let photo = photo {
            delegate?.photoWasUpdated(oldPhoto: photo, title: theText, imageData: dataImage)
        } else {
            delegate?.photoWasAdded(Photo(title: theText, imageData: dataImage))
        }
    navigationController?.popViewController(animated: true)
    }
    
    func setTheme() {
        guard let theme = themeHelper?.themePreference else {return}
        
        if theme == "Dark" {
            view.backgroundColor = UIColor.darkGray
        }
        
        if theme == "Blue" {
            view.backgroundColor = UIColor.systemBlue
        }
    }
    
    func updateViews() {
        guard let thePhoto = photo else {return}
        detailImageView?.image = UIImage(data: thePhoto.imageData)
        detailTextField?.text = thePhoto.title
    }

}

extension PhotoDetailViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            detailImageView.contentMode = .scaleAspectFit
            detailImageView.image = pickedImage
        }
     
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        dismiss(animated: true, completion: nil)
    }
    
}
