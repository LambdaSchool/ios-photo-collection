//
//  PhotoDetailViewController.swift
//  PhotoCollectionView
//
//  Created by Clayton Watkins on 4/29/20.
//  Copyright © 2020 Clayton Watkins. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    
    //MARK: - Properties
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - IBAction
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
