//
//  PhotoDetailViewController.swift
//  photoCollection
//
//  Created by Jonalynn Masters on 9/19/19.
//  Copyright © 2019 Jonalynn Masters. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    // MARK: Properties
    var photoController: PhotoController?
    var photo: Photo
    var themeHelper: ThemeHelper?
    
    // MARK: Outlets
    @IBOutlet var createPhotoImageView: UIImageView!

    @IBOutlet var captionTextField: UITextField!
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    @IBAction func addPhoto(_ sender: Any) {
    }
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
    }
    

    
    // MARK: - Navigation

   

}
