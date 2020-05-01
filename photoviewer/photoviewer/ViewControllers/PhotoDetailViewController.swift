//
//  PhotoDetailViewController.swift
//  photoviewer
//
//  Created by Ian French on 4/30/20.
//  Copyright © 2020 Ian French. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

   
    
    
    @IBOutlet weak var detailImage: UIImageView!
    
    
    @IBOutlet weak var detailTextField: UITextField!
    
    
    @IBAction func addPhoto(_ sender: UIButton) {
    }
    
    @IBAction func savePhoto(_ sender: Any) {
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
