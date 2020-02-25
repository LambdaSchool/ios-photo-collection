//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Chad Parker on 2/20/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!

    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addPhoto(_ sender: UIButton) {

    }

    @IBAction func savePhoto(_ sender: Any) {

    }
}
