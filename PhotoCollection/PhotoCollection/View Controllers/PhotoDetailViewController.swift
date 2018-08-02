//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Linh Bouniol on 8/2/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    var photo: Photo?
    var photoController: PhotoController?
    var themeHelper: ThemeHelper?

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var textField: UITextField!
    
    @IBAction func addPhoto(_ sender: Any) {
    }
    
    @IBAction func savePhoto(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
