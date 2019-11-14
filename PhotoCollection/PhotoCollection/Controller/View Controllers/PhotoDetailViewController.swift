//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Chad Rutherford on 11/14/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Properties
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addPhotoTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        
    }
}
