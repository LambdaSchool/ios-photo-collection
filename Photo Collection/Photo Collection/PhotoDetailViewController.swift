//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Simon Elhoej Steinmejer on 02/08/18.
//  Copyright © 2018 Simon Elhoej Steinmejer. All rights reserved.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    var photoController: PhotoController?
    var themeHelper: ThemeHelper?
    var photo: Photo?
    {
        didSet
        {
            guard let photo = photo else { return }
            updateViews(photo: photo)
        }
    }
    
    private func updateViews(photo: Photo)
    {
        titleTextField.text = photo.title
        photoImageView.image = UIImage(data: photo.imageData)
    }
    
    let photoImageView: UIImageView =
    {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        
        return iv
    }()
    
    let addPhotoButton: UIButton =
    {
        let button = UIButton(type: .system)
        button.setTitle("Add Photo", for: .normal)
        button.addTarget(self, action: #selector(handleAddPhoto), for: .touchUpInside)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 6
        
        return button
    }()
    
    let titleTextField: UITextField =
    {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Title"
        
        return tf
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupNavBar()
        setupUI()
        setTheme()
    }
    
    private func setupNavBar()
    {
        title = "Create Photo"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(handleSavePhoto))
    }
    
    @objc func handleSavePhoto()
    {
        guard let title = titleTextField.text, let image = photoImageView.image, let data = UIImagePNGRepresentation(image) else { return }
        
        if photo == nil
        {
            photoController?.createPhoto(with: data, title: title)
            navigationController?.popViewController(animated: true)
        }
        else
        {
            photoController?.updatePhoto(on: photo!, imageData: data, title: title)
            navigationController?.popViewController(animated: true)
        }

    }
    
    private func setTheme()
    {
        if let themePreference = themeHelper?.themePreference
        {
            self.view.backgroundColor = themePreference == "Dark" ? .darkGray : .blue
        }
    }
    
    @objc private func handleAddPhoto()
    {
        PHPhotoLibrary.requestAuthorization { (status) in
            if status == .authorized
            {
                DispatchQueue.main.async {
                    self.handleImageController()
                }
            }
            else
            {
                let alert = UIAlertController(title: "Warning", message: "We need permission to your photo library before you can add a memory.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }

    private func handleImageController()
    {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
        {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            imagePicker.delegate = self
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        if let editedPhoto = info["UIImagePickerControllerEditedImage"] as? UIImage
        {
            photoImageView.image = editedPhoto
        }
        else if let photo = info["UIImagePickerControllerOriginalImage"] as? UIImage
        {
            photoImageView.image = photo
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    private func setupUI()
    {
        view.addSubview(photoImageView)
        view.addSubview(addPhotoButton)
        view.addSubview(titleTextField)
        
        photoImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 20, paddingBottom: 0, width: 0, height: 245)
        
        addPhotoButton.anchor(top: photoImageView.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 16, paddingLeft: 8, paddingRight: 8, paddingBottom: 0, width: 0, height: 40)
        
        titleTextField.anchor(top: addPhotoButton.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 16, paddingLeft: 8, paddingRight: 8, paddingBottom: 0, width: 0, height: 40)
    }
    
    
}




















