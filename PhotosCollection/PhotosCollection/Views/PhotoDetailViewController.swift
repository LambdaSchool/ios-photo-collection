//
//  PhotoDetailViewController.swift
//  PhotosCollection
//
//  Created by Mike Nichols on 5/22/20.
//  Copyright © 2020 Mike Nichols. All rights reserved.
//

import UIKit

protocol PhotoDetailViewControllerDelegate

class PhotoDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleText: UITextField!
    
    var photoController: PhotoController
    var photo: Photo?
    var themeHelper: ThemeHelper? 

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPhoto() {
        
    }

    @IBAction func savePhoto() {
        
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
