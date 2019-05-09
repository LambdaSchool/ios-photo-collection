//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Thomas Cacciatore on 5/9/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        
        if themePreference == "Dark" {
            view.backgroundColor = .gray
        } else if themePreference == "Orange" {
            view.backgroundColor = .orange
        }
    }
    
    
    func updateViews() {
        setTheme()
        
        guard let photoData = photo?.imageData else { return }
        detailImageView.image = UIImage(data: photoData)
        
        
    }
    
    
    @IBAction func addPhoto(_ sender: Any) {
    }
    
    @IBAction func savePhoto(_ sender: Any) {
    }
    
    
    
    // Mark: Properties
    
    @IBOutlet weak var detailImageView: UIImageView!
    
    @IBOutlet weak var detailTextField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

}
