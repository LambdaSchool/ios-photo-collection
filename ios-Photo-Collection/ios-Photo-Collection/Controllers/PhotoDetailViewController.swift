//
//  PhotoDetailViewController.swift
//  ios-Photo-Collection
//
//  Created by LambdaSchoolVM_Catalina on 12/12/19.
//  Copyright © 2019 Sal Amer. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    
    //IB Outlets
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var imageTitleField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    //IB Actions
    @IBAction func addPhotoButtonWasPressed(_ sender: UIButton) {
    }
    @IBAction func savePhotoButtonWasPressed(_ sender: UIBarButtonItem) {
    }
    

}
