//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Bronson Mullens on 4/30/20.
//  Copyright © 2020 Bronson Mullens. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleTextView: UITextField!
    
    // MARK: - IBActions
    @IBAction func addPhotoTapped(_ sender: UIButton) {
        let chooseImage = UIImagePickerController()
        chooseImage.allowsEditing = true
        chooseImage.delegate = self
        present(chooseImage, animated: true)
    }
    
    @IBAction func savePhotoTapped(_ sender: UIBarButtonItem) {
        guard let photoController = photoController else { return }
        if let photo = photo {
            if let title = titleTextView.text,
                !title.isEmpty,
                let imageData = photoImageView.image?.pngData() {
                photoController.updatePhotos(photo: photo, image: imageData, title: title)
            }
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        updateViews()
    }
    
    func updateViews() {
        setTheme()
        guard let photo = photo else { return }
        photoImageView.image = UIImage(data: photo.imageData)
        titleTextView.text = photo.title
    }
    
    func setTheme() {
        guard let themeHelper = themeHelper else { return }
        if themeHelper.themePreference == "Dark" {
            view.backgroundColor = .gray
        } else {
            view.backgroundColor = .blue
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        photoImageView.image = image
        dismiss(animated: true, completion: nil)
    }
    
}
