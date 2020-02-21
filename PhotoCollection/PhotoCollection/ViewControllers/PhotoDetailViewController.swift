//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Rob Vance on 2/20/20.
//  Copyright © 2020 Rob Vance. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    // Mark: IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageTitleField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
        var photoController: PhotoController?
        var photo: Photo?
        var themeHelper: ThemeHelper?
        
    // Mark: IBActions
        
    @IBAction func addPhotoTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        
    }
    @IBAction func savePhotoTapped(_ sender: UIBarButtonItem) {
            let photoController = photoController,
            let image = imageView.image,
            let imageTitle = imageTitleField.text,
            let imageData = image.pngData()
//            !imageTitleField.isEmpty else { return }
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
