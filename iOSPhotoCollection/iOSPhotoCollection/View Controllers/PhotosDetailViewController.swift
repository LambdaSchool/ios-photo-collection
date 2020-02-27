//
//  PhotosDetailViewController.swift
//  iOSPhotoCollection
//
//  Created by Bhawnish Kumar on 2/27/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

import UIKit

class PhotosDetailViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var photoTextField: UITextField!
    
    
    
   var photoController: PhotoController?
   var photo: Photo?
   private var themeHelper: ThemeHelper?
    
    
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
