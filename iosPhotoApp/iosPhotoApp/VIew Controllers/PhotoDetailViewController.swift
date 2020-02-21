//
//  PhotoDetailViewController.swift
//  iosPhotoApp
//
//  Created by Jarren Campos on 2/20/20.
//  Copyright © 2020 Jarren Campos. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    //MARK- IBOutlets
    @IBOutlet var addImageView: UIImageView!
    
    @IBOutlet var userTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: IBActions
    
    @IBAction func savePhoto(_ sender: Any) {
    }
    @IBAction func addPhoto(_ sender: Any) {
    }
}
