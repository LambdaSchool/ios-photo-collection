//
//  PhotoDetailViewController.swift
//  ios-photo-collection
//
//  Created by denis cedeno on 10/10/19.
//  Copyright © 2019 DenCedeno Co. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTextField: UITextField!
    @IBAction func addPhoto(_ sender: Any) {
    }
    @IBAction func savePhoto(_ sender: Any) {
    }
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
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
