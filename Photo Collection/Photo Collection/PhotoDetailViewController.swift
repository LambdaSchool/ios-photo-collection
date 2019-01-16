//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Moses Robinson on 1/16/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    @IBAction func addPhoto(_ sender: Any) {
        
        
    }
    @IBAction func savePhoto(_ sender: Any) {
        
        
    }
    
    
    //MARK: - Properties
    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var photoNameText: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
}
