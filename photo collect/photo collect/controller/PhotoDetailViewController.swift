//
//  PhotoDetailViewController.swift
//  photo collect
//
//  Created by ronald huston jr on 4/23/20.
//  Copyright © 2020 HenryQuante. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    @IBOutlet weak var addPhotoImage: UIImageView!
    @IBOutlet weak var addPhotoTextField: UITextField!
    
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
