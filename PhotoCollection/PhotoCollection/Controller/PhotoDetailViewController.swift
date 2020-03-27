//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Shawn James on 3/26/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var imageNameTextField: UITextField!
    
    
    // MARK: - Properties
    
    let photoController: PhotoController?
    let photo: Photo?
    let themehelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Actions
    
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
