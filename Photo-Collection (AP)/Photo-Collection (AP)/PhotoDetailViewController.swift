//
//  PhotoDetailViewController.swift
//  Photo-Collection (AP)
//
//  Created by Samuel Esserman on 2/27/20.
//  Copyright © 2020 Samuel Esserman. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    
    
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
//MARK: - Action: Add Photo
    @IBAction func addPhoto(_ sender: Any) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
