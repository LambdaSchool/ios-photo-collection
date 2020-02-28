//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Harmony Radley on 2/27/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var photoTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPhoto(_ sender: Any) {
    }
    
    @IBAction func savePhoto(_ sender: Any) {
    }
    
    
    func setTheme() {
        
    }
    
    
    
    
    func updateViews() {
        guard let photo = photo else { return }
               
            imageView.image = UIImage(data: photo.imageData)
            photoTextField.text = photo.title
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
