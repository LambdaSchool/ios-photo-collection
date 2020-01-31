//
//  PhotoDetailViewController.swift
//  PhotoCollect
//
//  Created by Nick Nguyen on 1/30/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

import UIKit

class PhotoDetailVC: UIViewController   {

    var photoController : PhotoController?
    var photo: Photo?
    var themeHelper : ThemeHelper?
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
           super.viewDidLoad()
           updateViews()
           textField.becomeFirstResponder()
           title = "Create Photo"
           navigationController?.navigationBar.prefersLargeTitles = true
        
       }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setTheme()
    }
   
   
    @IBAction func addTapped(_ sender: UIButton) {
     
        showImagePickerControllerActionSheet()
        
    }
 
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        
        guard let photoController = photoController else { return }
        guard let text = textField.text else { return }
        guard let photoData = photoImage.image?.jpegData(compressionQuality: 1) else { return }
        if let photo = photo {
            photoController.update(photo: photo, image: photoData, title: text )
            
        }
        else {
            
            photoController.createPhoto(title: text, image: photoData)
        }
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
    @IBAction func textFieldChanged(_ sender: Any) {
        saveButton.isEnabled = textField.hasText
       
    }
    
   ///
    func setTheme() {
        guard let theme = themeHelper?.themePreference else { return }
        if theme == "Dark" {
            view.backgroundColor = UIColor.gray
         setUpStatusBarColorToGray()
            
        } else if theme == "Purple" {
            view.backgroundColor = UIColor.purple
        setUpStatusBarColorToPurple()
        }
       
    }
    
    func setUpStatusBarColorToGray() {
        if #available(iOS 13.0, *) {
            let app = UIApplication.shared
            let statusBarHeight: CGFloat = app.statusBarFrame.size.height
            
            let statusbarView = UIView()
            statusbarView.backgroundColor = UIColor.lightGray
            view.addSubview(statusbarView)
            
            statusbarView.translatesAutoresizingMaskIntoConstraints = false
            statusbarView.heightAnchor
                .constraint(equalToConstant: statusBarHeight).isActive = true
            statusbarView.widthAnchor
                .constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
            statusbarView.topAnchor
                .constraint(equalTo: view.topAnchor).isActive = true
            statusbarView.centerXAnchor
                .constraint(equalTo: view.centerXAnchor).isActive = true
            
        }
    }
    
    
    func setUpStatusBarColorToPurple() {
        if #available(iOS 13.0, *) {
                     let app = UIApplication.shared
                     let statusBarHeight: CGFloat = app.statusBarFrame.size.height

                     let statusbarView = UIView()
                     statusbarView.backgroundColor = UIColor.systemPurple
                     view.addSubview(statusbarView)

                     statusbarView.translatesAutoresizingMaskIntoConstraints = false
                     statusbarView.heightAnchor
                         .constraint(equalToConstant: statusBarHeight).isActive = true
                     statusbarView.widthAnchor
                         .constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
                     statusbarView.topAnchor
                         .constraint(equalTo: view.topAnchor).isActive = true
                     statusbarView.centerXAnchor
                         .constraint(equalTo: view.centerXAnchor).isActive = true

                 }
    }
    
    func updateViews() {
        guard let photo = photo else { return }
        photoImage.image = UIImage(data: photo.imageData)
        setTheme()
    }

}

   //MARK: - UIImagePickerViewController

extension PhotoDetailVC : UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func showImagePickerControllerActionSheet() {
        let ac = UIAlertController(title: "Choose your book's cover", message: nil, preferredStyle: .alert)
        let firstAction = UIAlertAction(title: "Choose from Library", style: .default) { (action) in
            self.showImagePickerController(sourceType: .photoLibrary)
        }
        let secondAction = UIAlertAction(title: "Take new photo", style: .default) { (action) in
            self.showImagePickerController(sourceType: .camera)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        ac.addAction(firstAction)
        ac.addAction(secondAction)
        ac.addAction(cancelAction)
        present(ac, animated: true, completion: nil)
    }
    
    func showImagePickerController(sourceType: UIImagePickerController.SourceType) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = sourceType
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            photoImage.image = editedImage
       } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
        photoImage.image = originalImage
        }
        dismiss(animated: true, completion: nil)
    }
    
}
