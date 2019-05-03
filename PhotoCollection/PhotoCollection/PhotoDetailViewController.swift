//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by morse on 5/2/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var actualTextField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    
    
    @IBAction func addPhotoButtonTapped(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
            
//            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
//                let image = info[UIImagePickerControllerOriginalImage] as! UIImage
//                imageView.image = image
//                dismiss(animated:true, completion: nil)
//            }
        }
        
        
    }
    
    
    @IBAction func savePhotoButtonTapped(_ sender: Any) {
        if photo != nil {
            guard let photo = photo, let image = imageView.image?.pngData() , let title = actualTextField.text else { return }
            photoController?.updatePhoto(photo: photo, imageData: image, title: title)
        } else {
            guard let image = imageView.image?.pngData(), let title = actualTextField.text else { return }
            photoController?.createPhoto(imageData: image, title: title)
        }
        dismiss(animated: true, completion: nil)
    }
    
    func setTheme() {
        guard let currentThemePreference = themeHelper?.themePreference else { return }
        
        if currentThemePreference == "Dark" {
            self.view.backgroundColor = .gray
        } else {
            self.view.backgroundColor = .purple
        }
    }
    
    func updateViews() {
        setTheme()
        if photo != nil {
            guard let photo = photo else { return }
            guard let image = UIImage(data: photo.imageData) else { return }
            actualTextField.text = photo.title
            imageView.image = image
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
