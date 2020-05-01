//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Bronson Mullens on 4/30/20.
//  Copyright © 2020 Bronson Mullens. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleTextView: UITextField!
    
    // MARK: - IBActions
    @IBAction func addPhotoTapped(_ sender: UIButton) {
    }
    @IBAction func savePhotoTapped(_ sender: UIBarButtonItem) {
    }
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()
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
