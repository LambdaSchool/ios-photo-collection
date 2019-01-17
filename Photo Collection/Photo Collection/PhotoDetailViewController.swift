//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Moses Robinson on 1/16/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        imagePicker.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        photoImage.image = pickedImage
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        guard let title = photoNameText.text, !title.isEmpty,
            let image = photoImage.image,
            let imageData = image.pngData() else { return }
        
        if let photo = photo {
            photoController?.updatePhoto(photo: photo, imageData: imageData, title: title)
        } else {
            photoController?.createPhoto(imageData: imageData, title: title)
        }
        navigationController?.popViewController(animated: true)
    }
    
    private func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        
        if themePreference == "Dark" {
            view.backgroundColor = #colorLiteral(red: 0.6466435194, green: 0.6634457111, blue: 0.7351312041, alpha: 1)
        } else if themePreference == "Purple" {
            view.backgroundColor = #colorLiteral(red: 0.5076087117, green: 0.5245476365, blue: 0.9441453815, alpha: 1)
        }
    }
    
    private func updateViews() {
        setTheme()
        guard let photo = photo else { return }
        
        photoImage.image = UIImage(data: photo.imageData)
        photoNameText.text = photo.title
    }
    
    //MARK: - Properties
    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var photoNameText: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
}
