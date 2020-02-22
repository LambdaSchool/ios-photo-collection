//
//  PhotoDetailViewController.swift
//  Photos
//
//  Created by Breena Greek on 2/19/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Properties
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    //MARK: IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var photoText: UITextField!
    
    // MARK: IBACtions
    @IBAction func savePhoto(_ sender: UIButton){
        if let photo = photo {
            if let photoController = photoController {
                if let text = photoText.text, !text.isEmpty, let photoData = imageView.image?.pngData() {
                    photoController.update(photo: photo, data: photoData, title: text)
                }
            }
        } else {
            if let photoController = photoController {
                if let text = photoText.text, !text.isEmpty {
                    let photoData = imageView.image?.jpegData(compressionQuality: 1)
                    
                    photoController.create(imageData: photoData!, title: text)
                }
            }
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true)
  }
    
    func setTheme() {
        guard let themeHelper = themeHelper else { return }
        if themeHelper.themePreference == "Dark" {
            view.backgroundColor = .gray
        } else {
            view.backgroundColor = .purple
        }
    }
    
    func updateViews() {
        setTheme()
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
        photoText.text = photo.title
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {
            print("No Image found")
            return }
            imageView.image = image
            dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        self.title = "Create Photo"
    }
}

