//
//  PhotoDetailViewController.swift
//  ios-Photo-Collection
//
//  Created by LambdaSchoolVM_Catalina on 12/12/19.
//  Copyright © 2019 Sal Amer. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    
    //IB Outlets
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var imageTitleField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
       func setTheme() {
            guard let themeHelper = themeHelper else { return }
            if let themePreference = themeHelper.themePreference {
                if themePreference == "Dark" {
                    view.backgroundColor = UIColor.darkGray
                } else if themePreference == "Red" {
                    view.backgroundColor = UIColor.red
                }
            }
        }
        
    func updateViews() {
        setTheme()
        guard let photo = photo else { return }
        imageOutlet.image = UIImage(data: photo.imageData)
        imageTitleField.text = photo.title
    }

    //IB Actions
    @IBAction func addPhotoButtonWasPressed(_ sender: UIButton) {
    }
    @IBAction func savePhotoButtonWasPressed(_ sender: UIBarButtonItem) {
    }
    

}
