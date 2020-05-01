//
//  PhotoDetailViewController.swift
//  PhotoCollectionView
//
//  Created by Clayton Watkins on 4/29/20.
//  Copyright © 2020 Clayton Watkins. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    //MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    
    //MARK: - Properties
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews(){
        setTheme()
        
        if let photo = photo{
            self.title = "Edit Photo"
            imageView.image = UIImage(data: photo.imageData)
            textField.text = photo.title
        }else {
            self.title = "Add Photo"
        }
    }
    
    //MARK: - IBActions
    
    @IBAction func addPhoto(_ sender: Any) {
        addPhotoPickerController()
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        guard let imageTitle = textField.text,
            let image = imageView.image,
            let imageData = image.pngData() else { return }
        
        if let photo = photo{
            photoController?.update(photo: photo, data: imageData, string: imageTitle)
        } else{
            photoController?.create(imgData: imageData, imgName: imageTitle)
        }
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Helper Functinos
    func setTheme(){
        guard let theme = themeHelper?.themePreference else { return }
        if theme == "Dark"{
            view.backgroundColor = .darkGray
        } else {
            view.backgroundColor = .cyan
        }
    }
    
    //MARK: - Delegate Methods
    func addPhotoPickerController(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        imageView.image = image
    }
}
