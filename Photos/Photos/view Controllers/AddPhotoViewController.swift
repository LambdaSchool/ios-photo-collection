//
//  AddPhotoViewController.swift
//  Photos
//
//  Created by Marlon Raskin on 7/25/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController {
    // MARK: -Properties
    var photoController: PhotoController?
    var photo:Photo?
    var themeHelper:ThemeHelper?
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var selectPhotoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: -Actions
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func selectButtonPressed(_ sender: UIButton) {
    }
}
