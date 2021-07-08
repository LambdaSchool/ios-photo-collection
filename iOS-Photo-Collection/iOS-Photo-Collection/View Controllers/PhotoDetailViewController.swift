//
//  PhotoDetailViewController.swift
//  iOS-Photo-Collection
//
//  Created by Vijay Das on 1/16/19.
//  Copyright © 2019 Vijay Das. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    
    @IBOutlet weak var photoImageView: UIImageView!

    @IBOutlet weak var photoTextField: UITextField!
    
    
    @IBAction func addPhoto(_ sender: UIButton) {



    }
    

    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
 
        
    
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
