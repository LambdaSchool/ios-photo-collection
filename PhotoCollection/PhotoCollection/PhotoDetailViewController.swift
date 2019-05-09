//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Ryan Murphy on 5/9/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    
    let photoController: PhotoController?
    let photo: Photo?
    let themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

  

    @IBAction func saveButtonPressed(_ sender: Any) {
    }
    @IBAction func addPhotoButtonPressed(_ sender: Any) {
    }
}
