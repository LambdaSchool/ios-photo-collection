//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by admin on 7/25/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
	
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var descriptionTextField: UITextField!
	
	var photoController: PhotoController?
	var photo: Photo?
	var themeHelper: ThemeHelper?	

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

	@IBAction func addPhoto(_ sender: Any) {
	}
	
	@IBAction func savePhoto(_ sender: Any) {
	}
}

