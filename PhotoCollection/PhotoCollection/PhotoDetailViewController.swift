//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Nonye on 4/23/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var detailImageView: UIImageView!
    
    @IBOutlet weak var imageTextField: UITextField!
    
    @IBOutlet weak var addPhoto: UIButton!
    
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
