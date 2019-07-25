//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Alex Rhodes on 7/25/19.
//  Copyright © 2019 Blake Andrew Price. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var photoDescriptionTextField: UITextField!
    
    var photoContoller: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addPhotoButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
    }
    

}
