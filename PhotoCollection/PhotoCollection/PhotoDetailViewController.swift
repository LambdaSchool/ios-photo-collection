//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Richard Gibbs on 5/21/20.
//  Copyright © 2020 Rich Gibbs. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    @IBAction func savePhoto(_ sender: Any) {
        
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
    }
    @IBOutlet weak var newPhotoTextField: UITextField!
    @IBOutlet weak var newImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        updateViews()
        
        // Do any additional setup after loading the view.
    }
    
    func setTheme() {
        
    }
    
    func updateViews() {
        guard let photo = photo else { return }
        newPhotoTextField.text = photo.title
        newImageView.image = UIImage(data: photo.imageData)
    }
}

extension PhotosCollectionViewController: UIImagePickerControllerDelegate {
    
}


extension PhotosCollectionViewController: UINavigationControllerDelegate {
    
}
