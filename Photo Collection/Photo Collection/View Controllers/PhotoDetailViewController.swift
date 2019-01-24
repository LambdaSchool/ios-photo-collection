//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Stuart on 1/23/19.
//  Copyright © 2019 Stuart. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate {

    // MARK: - Set Theme
    
    func setTheme() {
        if let currentTheme = themeHelper?.themePreference {
            if currentTheme == "Aqua" {
                self.view.backgroundColor = .blue
            } else if currentTheme == "Dark" {
                self.view.backgroundColor = .black
            }
        }
    }
    
    // MARK: - Update Views
    
    func updateViews() {
        setTheme()
        
        if let photo = photo {
            imageView.image = photo.imageData //UIImage(data: photo.imageData)
        }
    }
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    // MARK: - Image Picker
    
    func presentImagePickerController() {
        
    }
    
    // MARK: IBActions & Properties
    
    @IBAction func addPhoto(_ sender: UIButton) {
        
    }
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
        
    }
    
    // MARK: - IBOutlets & Properties
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    var photo: Photo?
    
    let photoController = PhotoController()
    var themeHelper: ThemeHelper?
    
    }

