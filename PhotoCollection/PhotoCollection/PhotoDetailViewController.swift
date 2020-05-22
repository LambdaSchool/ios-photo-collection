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

        // Do any additional setup after loading the view.
    }
    

  

}
