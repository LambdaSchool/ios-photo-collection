//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Stuart on 1/23/19.
//  Copyright © 2019 Stuart. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    // MARK: IBActions & Properties
    
    @IBAction func addPhoto(_ sender: UIButton) {
        
    }
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
        
    }
    
    // MARK: - IBOutlets & Properties
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    var photo: Photo?
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
}

