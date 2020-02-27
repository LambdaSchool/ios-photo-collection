//
//  AddPhotoViewController.swift
//  Photo Collection
//
//  Created by Lambda_School_Loaner_259 on 2/27/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var addTitleTextField: UITextField!
    
    
    // MARK: - Properties
    var photoContoller: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    // MARK: - IBActions
    @IBAction func addPhoto(_ sender: Any) {
    }
    
    @IBAction func savePhoto(_ sender: Any) {
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
