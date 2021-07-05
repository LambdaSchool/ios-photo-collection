//
//  AddPhotoViewController.swift
//  Photos
//
//  Created by Marlon Raskin on 7/25/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController, ThemeHelperAccessable {

    // MARK: -Properties & Outlets

    var photoController: PhotoController?
    var photo:Photo?
    var themeHelper: ThemeHelper?
	let pickerController = UIImagePickerController()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var selectPhotoButton: UIButton!
	@IBOutlet weak var titleTextField: UITextField!
	@IBOutlet weak var trashButton: UIButton!


	// MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
		updateViews()
		imageView.layer.cornerRadius = 8
		selectPhotoButton.layer.cornerRadius = 8
		pickerController.delegate = self
		let originalImage = UIImage(named: "trash")
		let tintedImage = originalImage?.withRenderingMode(.alwaysTemplate)
		trashButton.setImage(tintedImage, for: .normal)
		titleTextField.delegate = self
    }

	// MARK: - Update Views

	func updateViews() {
		setTheme()
		switch photo {
		case .none:
			title = "Add Photo"
			trashButton.isHidden = true
		case photo:
			guard let photo = photo else { return }
			imageView.image = UIImage(data: photo.imageData)
			imageView.contentMode = .scaleAspectFill
			titleTextField.text = photo.title
			title = "Update Photo"
			trashButton.isHidden = false
		default:
			()
		}
	}


	// MARK: - Theme Method

	func setTheme() {
		guard let theme = themeHelper?.themePreference else { return }
		switch theme {
		case "Dark":
			view.backgroundColor = Colors.dark
			titleTextField.backgroundColor = Colors.darkBGText
			selectPhotoButton.layer.borderWidth = 2
			selectPhotoButton.layer.borderColor = Colors.darkBGAccent.cgColor
			selectPhotoButton.tintColor = Colors.darkBGText
			titleTextField.backgroundColor = Colors.darkTextField
			titleTextField.textColor = Colors.darkBGText
			titleTextField.keyboardAppearance = .dark
			trashButton.tintColor = Colors.raspberryRed
		case "Raspberry Red":
			view.backgroundColor = Colors.raspberryRed
			titleTextField.backgroundColor = Colors.redBGAccent
			titleTextField.textColor = Colors.redBGText
			titleTextField.keyboardAppearance = .light
			selectPhotoButton.layer.borderWidth = 2
			selectPhotoButton.layer.borderColor = Colors.redBGAccent.cgColor
			selectPhotoButton.tintColor = Colors.redBGText
			trashButton.tintColor = Colors.redBGAccent
		default:
			()
		}
	}

    
    //MARK: -Actions

    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
		guard let imageData = imageView.image?.pngData(),
			let photoController = photoController,
			let title = titleTextField.text else {
				return
		}

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

	@IBAction func deleteButtonTapped(_ sender: UIButton) {
		guard let photo = photo else { return }
		let alertMessage = "Are you sure you want to delete this photo?"
		let deleteAlert = UIAlertController(title: alertMessage, message: nil, preferredStyle: .alert)
		let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
		let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (delete) in
			self.photoController?.deletePhoto(photo: photo)
			self.navigationController?.popToRootViewController(animated: true)
		}
		[cancelAction, deleteAction].forEach { deleteAlert.addAction($0) }
		present(deleteAlert, animated: true, completion: nil)
	}
}

extension AddPhotoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		guard let image = info[.originalImage] as? UIImage else { return }
		imageView.image = image
		imageView.contentMode = .scaleAspectFill
		dismiss(animated: true, completion: nil)
	}

	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		dismiss(animated: true, completion: nil)
	}
}

extension AddPhotoViewController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		return titleTextField.resignFirstResponder()
	}
}
