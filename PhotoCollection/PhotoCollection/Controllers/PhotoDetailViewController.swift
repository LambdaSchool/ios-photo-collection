//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by admin on 7/25/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
	
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var descriptionTextField: UITextField!
	
	var photoController: PhotoController?
	var photo: Photo?
	var themeHelper: ThemeHelper?
	var pickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		pickerController.delegate = self
        updateViews()
    }

	@IBAction func addPhoto(_ sender: Any) {
        present(pickerController, animated: true, completion: nil)
	}
	
	@IBAction func savePhoto(_ sender: Any) {
        if let imageData = imageView.image?.pngData(), let description = descriptionTextField.text{
            if let photo = photo  {
                photoController?.update(photo: photo, data: imageData, title: description)
            } else {
                photoController?.create(data: imageData, title: description)
            }
            navigationController?.popViewController(animated: true)
        }
        
        
	}
    
    func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        view.backgroundColor = UIColor(named: themePreference)
    }
    
    func updateViews() {
        setTheme()
		
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
        descriptionTextField.text = photo.title
        
    }
    
}

extension PhotoDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
			imageView.contentMode = .scaleAspectFit
			imageView.image = pickedImage
		}
		dismiss(animated: true, completion: nil)
	}
}
