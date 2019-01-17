//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Cameron Dunn on 1/16/19.
//  Copyright © 2019 Cameron Dunn. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    var photoController : PhotoController?
    var photo : Photo?
    var themeHelper : ThemeHelper?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
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
