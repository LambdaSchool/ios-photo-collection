//
//  AddPhotoViewController.swift
//  Photos
//
//  Created by Marlon Raskin on 7/25/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController {

    // MARK: -Properties & Outlets

    var photoController: PhotoController?
    var photo:Photo?
    var themeHelper:ThemeHelper?
	let pickerController = UIImagePickerController()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var selectPhotoButton: UIButton!
	@IBOutlet weak var titleTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
		updateViews()
		imageView.layer.cornerRadius = 8
		pickerController.delegate = self
        
    }

	func updateViews() {
		switch photo {
		case .none:
			title = "Add Photo"
		case photo:
			guard let photo = photo else { return }
			imageView.image = UIImage(data: photo.imageData)
			titleTextField.text = photo.title
			title = "Update Photo"
		default:
			()
		}
//		guard let photo = photo else { return }
//		imageView.image = UIImage(data: photo.imageData)
//		titleTextField.text = photo.title
//		title = "Update Photo"
	}
    
    //MARK: -Actions

    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
		guard let imageData = imageView.image?.pngData(),
			let photoController = photoController,
			let title = titleTextField.text else { return }

		let newPhoto = Photo(imageData: imageData, title: title)

		if photo == nil {
			photoController.addPhoto(photo: newPhoto)
		} else {
			guard let photo = photo else { return }
			photoController.updatePhoto(photo: photo, data: imageData, title: title)
		}
		navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func selectButtonPressed(_ sender: UIButton) {
		if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
			pickerController.sourceType = .photoLibrary
			self.present(pickerController, animated: true, completion: nil)
		}
    }
}

extension AddPhotoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		guard let image = info[.originalImage] as? UIImage else { return }
		imageView.image = image
		dismiss(animated: true, completion: nil)
	}

	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		dismiss(animated: true, completion: nil)
	}
}
