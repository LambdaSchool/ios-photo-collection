//
//  PhotoDetailViewController.swift
//  ios-photo-collection
//
//  Created by Taylor Lyles on 5/2/19.
//  Copyright © 2019 Taylor Lyles. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

	var photoController: PhotoController?
	var photo: Photo?
	var themeHelper: ThemeHelper?
	
	@IBAction func savePhoto(_ sender: Any) {
		guard let title = photoTextView.text, !title.isEmpty else { return }
		if let photo = photo {
			if let data = photoImageView.image?.pngData() {
				photoController?.update(photo: photo, withImage: data, titled: title)
			}
		} else {
			if let data = photoImageView.image?.pngData() {
				photoController?.createPhoto(titled: title, imageData: data)
			}
		}
		navigationController?.popViewController(animated: true)
	}
	
	@IBAction func addPhoto(_ sender: Any) {
		let picker = UIImagePickerController()
		picker.sourceType = .photoLibrary
		picker.delegate = self
		present(picker, animated: true)
	}
	
	@IBOutlet weak var photoImageView: UIImageView!
	
	@IBOutlet weak var photoTextView: UITextField!

	
    override func viewDidLoad() {
        super.viewDidLoad()
		updateViews()
		
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		updateViews()
	}
	
	func setTheme() {
		if themeHelper?.themePreference == "Dark" {
			view.backgroundColor = .black
		} else {
			view.backgroundColor = UIColor(red: 1.0, green: 136 / 255, blue: 253 / 255, alpha: 1.0)
		}
	}
	
	
	func updateViews() {
		setTheme()
		guard let photo = photo, let image = UIImage(data: photo.imageData) else { return }
			
		photoImageView.image = image
		photoTextView.text = photo.title
		
	}
}

extension PhotoDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		guard let importImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {return}
		
		dismiss(animated: true)
		photoImageView.image = importImage

	}
	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		dismiss(animated: true)
	}
}
