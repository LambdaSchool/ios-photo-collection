//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Nichole Davidson on 2/27/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    private var imageView = UIImageView()
    private var addPhotoTitle = UITextField()
    private var addImageButton = UIButton()
    
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        imagePicker.delegate = self

    }
    
    func setTheme() {
        if themeHelper?.themePreference == "Sienna" {
          self.view.backgroundColor = UIColor(red: 235, green: 100, blue: 100, alpha: 1)
      } else {
          self.view.backgroundColor = UIColor.darkGray
      }
    }
    
    func updateViews() {
        
        guard let newImage = photo?.imageData,
               let image = UIImage(data: newImage),
               let title = addPhotoTitle.text else { return }
               
               imageView.image = image
               addPhotoTitle.text = title
    }
    
    func setUpSubviews() {
        
        // ImageView
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 8).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.25).isActive = true
        
        // Add Image Button
        view.addSubview(addImageButton)
        addImageButton.translatesAutoresizingMaskIntoConstraints = false
        addImageButton.setTitle("Add Image", for: .normal)
        addImageButton.addTarget(self, action: #selector(addPhoto), for: .touchUpInside)
        
        addImageButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 45).isActive = true
        addImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // Photo Title Text Field
        view.addSubview(addPhotoTitle)
        addPhotoTitle.translatesAutoresizingMaskIntoConstraints = false
        addPhotoTitle.placeholder = "Give this photo a title:"
        
        addPhotoTitle.topAnchor.constraint(equalTo: addImageButton.bottomAnchor, constant: 16).isActive = true
        
        
        
        
        
    }
    
    @objc func addPhoto(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
        
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        
        if photo?.imageData != nil {
                  updateViews()
              }
              navigationController?.popViewController(animated: true)

    }
    
    // MARK: - UIImagePickerControllerDelegate Methods
     
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            addImage.contentMode = .scaleAspectFit
            addImage.image = pickedImage
        }
     
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
