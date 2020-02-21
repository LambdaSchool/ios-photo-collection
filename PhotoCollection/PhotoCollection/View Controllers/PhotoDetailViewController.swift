//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Lambda_School_Loaner_259 on 2/20/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    // MARK: Properties
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    // MARK: IBOutlets
    @IBOutlet var imageTextField: UITextField!
    @IBOutlet var addImageView: UIImageView!
    
    // MARK: IBActions
    @IBAction func addPhoto(_ sender: Any) {
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
