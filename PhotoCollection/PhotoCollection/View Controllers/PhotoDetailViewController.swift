//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Elizabeth Thomas on 2/20/20.
//  Copyright © 2020 Libby Thomas. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    // MARK: - IBOutlets
    @IBOutlet weak var photoDetailImageView: UIImageView!
    @IBOutlet weak var photoTitleTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    // MARK: - IBActions
    @IBAction func addPhoto(_ sender: Any) {
        
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        
    }
  
}
