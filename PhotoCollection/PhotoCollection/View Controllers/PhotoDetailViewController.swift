//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Jordan Christensen on 8/23/19.
//  Copyright © 2019 Mazjap Co Technologies. All rights reserved.
//

import UIKit
import PhotosUI
import Photos

class PhotoDetailViewController: UIViewController,
UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addPhotoTapped(_ sender: Any) {
        let photoLibrary = PHPhotoLibrary.authorizationStatus()
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) && photoLibrary == .authorized {
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        imageView.image = image
        dismiss(animated:true, completion: nil)
    }

    
    @IBAction func saveTapped(_ sender: Any) {
        guard let name = nameTextField.text, let data = imageView.image else { return }
        photoController?.addPhoto(title: name, data: data)
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
