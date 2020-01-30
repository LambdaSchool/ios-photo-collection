//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Chris Gonzales on 1/30/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var photoDetailText: UITextField!
    
    @IBAction func addPhoto(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
