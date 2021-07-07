//
//  PhotosDetailViewController.swift
//  ios-photo-collection
//
//  Created by Lambda_School_Loaner_101 on 6/13/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class PhotosDetailViewController: UIViewController {
    
    @IBOutlet weak var newPhotoImageView: UIImageView!
    @IBOutlet weak var photoTextField: UITextField!
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
