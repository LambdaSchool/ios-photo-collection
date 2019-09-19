//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Dennis on 9/19/19.
//  Copyright © 2019 LambdaSchool. All rights reserved.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController {
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTextField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = UIImage(data: photo!.imageData){
            detailImageView.image = image
        }

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addPhotoButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
        guard let title = detailTextField.text,
        let image = detailImageView.image,
            let imageData = image.pngData() else { return }
        if let photo = photo {
            photoController?.update(photo: photo, data: imageData, string: title)
        } else {
            photoController?.create(imageData: imageData, title: title)
        }
    }
    func updateViews() {
        setTheme()
    }
    
    
    func setTheme() {
        guard let currentPreference = themeHelper?.themePreference else { return }
        if currentPreference == "Blue" {
            self.view.backgroundColor = UIColor(red: 50, green: 80, blue: 90, alpha: 1)
        } else {
            self.view.backgroundColor = UIColor(red: 169, green: 169, blue: 169, alpha: 1)
        }
    }
}
