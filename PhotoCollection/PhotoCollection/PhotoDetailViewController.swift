//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Christopher Aronson on 5/2/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
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

    @IBAction func addPhotoButtonPressed(_ sender: Any) {
    }
    
    @IBAction func saveItemPressed(_ sender: Any) {
    }
}
