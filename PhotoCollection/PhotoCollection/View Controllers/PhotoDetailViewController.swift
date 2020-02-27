//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Nichole Davidson on 2/27/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var addImage: UIImageView!
    @IBOutlet weak var addPhotoTitle: UITextField!
    
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addPhoto(_ sender: Any) {
    }
    
    @IBAction func savePhoto(_ sender: Any) {
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
