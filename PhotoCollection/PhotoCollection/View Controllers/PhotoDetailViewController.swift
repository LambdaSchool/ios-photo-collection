//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Lisa Sampson on 8/9/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        setTheme()

    }
    
    @IBAction func addPhoto(_ sender: Any) {
        presentImagePickerController()
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        guard let title = textField.text,
            let image = imageView.image,
            let imageData = UIImagePNGRepresentation(image) else { return }
        
        if let photo = photo {
            photoController?.update(photo: photo, imageData: imageData, title: title)
        } else {
            photoController?.create(imageData: imageData, title: title)
        }
        navigationController?.popViewController(animated: true)
    }
    
    func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        
        if themePreference == "Purple" {
            self.view.backgroundColor = UIColor.purple
        } else {
            self.view.backgroundColor = UIColor.darkGray
        }
    }
    
    func updateViews() {
        if let photo = photo {
            navigationItem.title = "Edit Photo"
            imageView?.image = UIImage(data: photo.imageData)
            textField?.text = photo.title
        } else {
            navigationItem.title = "Add Photo"
        }
    }
    
    func presentImagePickerController() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }
        imageView.image = image
    }
    
    var photoController: PhotoController?
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    var themeHelper: ThemeHelper? {
        didSet {
            setTheme()
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
}
