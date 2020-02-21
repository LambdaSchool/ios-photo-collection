//
//  PhotoDetailViewController.swift
//  Photos
//
//  Created by Breena Greek on 2/19/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Properties
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    var imagePicker = UIImagePickerController()
    
    //MARK IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var photoText: UITextField!
    
    // MARK IBACtions
    @IBAction func savePhoto(_ sender: Any){
        guard let image = imageView.image,
            let imageData = image.pngData(),
            let title = photoText.text else { return }
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
}

