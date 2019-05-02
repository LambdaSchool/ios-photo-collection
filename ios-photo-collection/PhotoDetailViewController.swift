//
//  PhotoDetailViewController.swift
//  ios-photo-collection
//
//  Created by Taylor Lyles on 5/2/19.
//  Copyright © 2019 Taylor Lyles. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		
    }
    
	var photoController: PhotoController?
	var photo: Photo?
	var themeHelper: ThemeHelper?
	
	@IBAction func savePhoto(_ sender: Any) {
	}
	
	@IBAction func addPhoto(_ sender: Any) {
	}
	
	@IBOutlet weak var photoImageView: UIImageView!
	
	@IBOutlet weak var photoTextView: UITextField!
}
