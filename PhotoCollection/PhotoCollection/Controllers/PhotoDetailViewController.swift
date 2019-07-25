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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
        // Do any additional setup after loading the view.
    }

	@IBAction func addPhoto(_ sender: Any) {
        
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

