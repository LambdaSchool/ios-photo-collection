//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Chris Price on 2/21/20.
//  Copyright © 2020 Chris Price. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTextField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        setTheme()
        guard let imageData = photo?.imageData else {return}
        detailImageView.image = UIImage(data: imageData)
        detailTextField.text = photo?.title
    }
    
    func setTheme() {
        guard let themePreference = themeHelper?.themePreference else {return}
        if themePreference == "Dark" {
            view.backgroundColor = .darkGray
        } else {
            view.backgroundColor = .blue
        }
    }
    
    @IBAction func addPhotoTapped(_ sender: UIButton) {
    }
    @IBAction func savePhotoTapped(_ sender: UIBarButtonItem) {
        if photoController.photos[]
    }
    
}
