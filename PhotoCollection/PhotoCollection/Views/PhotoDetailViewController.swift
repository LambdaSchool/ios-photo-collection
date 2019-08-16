//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Joel Groomer on 8/15/19.
//  Copyright © 2019 Julltron. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    @IBOutlet weak var imgPhoto: UIImageView!
    @IBOutlet weak var txtTitle: UITextField!
    
    var photoController: PhotoController?
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addPhotoTapped(_ sender: Any) {
    }
    
    @IBAction func savePhotoTapped(_ sender: Any) {
    }
}
