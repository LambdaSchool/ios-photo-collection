//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Bling Morley on 3/26/20.
//  Copyright © 2020 Cody Morley. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    //OUTLETS
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    
    
    //DELEGATES
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    
    
    //ACTIONS AND FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
        
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
