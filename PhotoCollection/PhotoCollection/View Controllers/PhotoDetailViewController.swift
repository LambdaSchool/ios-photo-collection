//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by David Wright on 12/12/19.
//  Copyright © 2019 David Wright. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    // MARK: Properties

    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    // MARK: IBOutlets

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    
    // MARK: IBActions

    @IBAction func addPhoto(_ sender: UIButton) {
        
    }
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
        
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
