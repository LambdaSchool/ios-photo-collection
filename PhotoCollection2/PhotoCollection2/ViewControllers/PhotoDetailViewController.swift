//
//  PhotoDetailViewController.swift
//  PhotoCollection2
//
//  Created by brian vilchez on 8/22/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit
import Photos


class PhotoDetailViewController: UIViewController {

    var photoController: PhotoController?
    var photo:Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var PhotoImage: UIImageView!
    @IBOutlet weak var photoTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        guard let photo = photo else {return}
        setTheme()
        PhotoImage.image = UIImage(data: photo.imageData)
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
        PhotoLibrary()
    }
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
        
    }
    

    /// sets the detail view background color to the value of user defaults
    func setTheme() {
        if let selectedTheme = themeHelper?.themePreference {
            if selectedTheme == "Dark" {
                view.backgroundColor = .darkGray
            } else if selectedTheme == "blue" {
               view.backgroundColor = .blue
            }
        }
    }
}

extension PhotoDetailViewController: UIImagePickerControllerDelegate {
    
    private func PhotoLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self;
            myPickerController.sourceType = .photoLibrary
            self.present(myPickerController, animated: true, completion: nil)
        }
    }
}

extension PhotoDetailViewController: UINavigationControllerDelegate {
    
}
