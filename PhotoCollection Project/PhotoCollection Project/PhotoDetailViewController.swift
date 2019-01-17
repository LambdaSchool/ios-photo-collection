//
//  PhotoDetailViewController.swift
//  PhotoCollection Project
//
//  Created by Michael Flowers on 1/16/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoTitleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
        print("saved button pressed")
        
        //check to see if photo was passed in
        guard let passedInPhoto = photo else {
            //theres not a photo already so i have to create an instance of a photo
            //check photoImageView.image, convert that into DATA, check to see if there is text in the title textField - we need this information to create photo
            if let photoImage = photoImageView.image, let imageData = photoImage.pngData(), let title = photoTitleTextField.text, !title.isEmpty  {
                photoController?.createPhoto(with: imageData, title: title)
            }
            navigationController?.popToRootViewController(animated: true)
            return }
        
        //there is already a photo passed in. update the function
        photoController?.update(photo: passedInPhoto, newImageData: passedInPhoto.imageData, newTitle: passedInPhoto.title)
        
//        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = false
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func setTheme(){
        //check to see if thre is a value in themeHelper
        guard let currentPrefrence = themeHelper?.themePreference else { return }
        
        //check to see what the value is
        if currentPrefrence == "Dark" {
            view.backgroundColor = .brown
        } else {
            view.backgroundColor = .cyan
        }
    }
    
    func updateViews(){
        setTheme()
        guard let passedInPhoto = photo else { return }
        let image = UIImage(data: passedInPhoto.imageData)
        photoImageView.image = image
        photoTitleTextField.text = passedInPhoto.title
        
    }
}


extension PhotoDetailViewController:  UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //make sure user selected an image
        if let photoSelected = info[.originalImage] as? UIImage {
            photoImageView.image = photoSelected
        } else {
            print("There was a problem getting the image")
        }
        dismiss(animated: true, completion: nil)
    }
    
}
