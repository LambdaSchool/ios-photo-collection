//
//  PhotoDetailController.swift
//  MBP-iOS4-PhotoCollection-Dillon-Walkthrough
//
//  Created by Vijay Das on 12/6/18.
//  Copyright © 2018 Vijay Das. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var photoTextField: UITextField!
    
    
    @IBAction func addPhoto(_ sender: Any) {
    }
    
    
    @IBOutlet weak var savePhoto: UIBarButtonItem!
    
    

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
