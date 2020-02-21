//
//  PhotoDetailViewController.swift
//  Photos
//
//  Created by Breena Greek on 2/19/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    // Properties
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    // IBActions
    @IBOutlet weak var savePhoto: UIBarButtonItem!
    @IBOutlet weak var addPhoto: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

