//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Jon Bash on 2019-10-17.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addPhotoTapped(_ sender: UIButton) {
    }
    
    @IBAction func savePhotoTapped(_ sender: UIBarButtonItem) {
    }
    
}

