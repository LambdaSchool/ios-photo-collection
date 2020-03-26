//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Cameron Collins on 3/26/20.
//  Copyright © 2020 Cameron Collins. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    //Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textFieldTitle: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Variables
    let photoController: PhotoController? = nil
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    //Actions
    @IBAction func buttonAddPhoto(_ sender: Any) {
    }
    
    @IBAction func buttonSavePhoto(_ sender: Any) {
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
