//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Nathanael Youngren on 1/16/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    @IBAction func addPhoto(_ sender: UIButton) {
        
    }
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
        
    }
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

}
