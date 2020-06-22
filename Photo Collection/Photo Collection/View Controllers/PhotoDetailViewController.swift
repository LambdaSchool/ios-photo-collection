//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by macbook on 9/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    // MARK: - Properties
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    
    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    
    // VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    
    
    // MARK: - IBActions
    
    // Add Photo
    @IBAction func addPhoto(_ sender: UIButton) {
    }
    
    
    
    // Save Button
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        
        guard let title = textField.text,
            let imageData = imageView.image,
            title != "",
            imageData != nil else { return }
        
        if let photo = photo {
           // photoController?.updatePhoto(photo: photo, imageData: imageData, title: textField.text)
            
        } else {
            //photoController?.createPhoto(imageData: imageData, title: title)
        }
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    //MARK: - SET Theme function
    func setTheme() {
        guard let theme = themeHelper?.themePreference else { return }
        
        if theme == "Dark" {
            view.backgroundColor = .darkGray
        }
        else if theme == "Green" {
            view.backgroundColor = .green
        } else { return }
    }
    
    
    func updateViews() {
        setTheme()
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
    }
}
