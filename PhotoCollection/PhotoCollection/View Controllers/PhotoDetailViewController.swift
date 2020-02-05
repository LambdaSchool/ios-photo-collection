//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Vijay Das on 1/24/19.
//  Copyright © 2019 Vijay Das. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    
    @IBOutlet weak var detailImageView: UIImageView!
    
    @IBOutlet weak var detailNameTextField: UITextField!
    
    
    @IBAction func addPhoto(_ sender: UIButton) {
    }
    
    
    
    @IBAction func savePhoto(_ sender: Any) {
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
