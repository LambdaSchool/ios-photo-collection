//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Jon Bash on 2019-10-17.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateViews()
    }
    
    // MARK: - Methods
    
    func updateViews() {
        if let themeHelper = themeHelper {
            themeHelper.setTheme(for: view)
        }
        
        if let photo = photo {
            imageView.image = UIImage(data: photo.imageData)
            navigationItem.title = photo.title
        }
    }

    // MARK: - IB Actions
    
    @IBAction func addPhotoTapped(_ sender: UIButton) {
         
    }
    
    @IBAction func savePhotoTapped(_ sender: UIBarButtonItem) {
        if let photo = photo, let visibleImage = imageView.image {
            
        } else {
            
        }
    }
    
}

