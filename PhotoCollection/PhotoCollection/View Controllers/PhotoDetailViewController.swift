//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Jessie Ann Griffin on 8/14/19.
//  Copyright © 2019 Jessie Griffin. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var detailTextField: UITextField!
    
    var photoComtroller: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addPhoto(_ sender: UIButton) {
    }
    
    @IBAction func savePhoto(_ sender: Any) {
    }
    
}

