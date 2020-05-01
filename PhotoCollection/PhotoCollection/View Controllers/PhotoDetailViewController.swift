//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Bohdan Tkachenko on 4/30/20.
//  Copyright © 2020 Bohdan Tkachenko. All rights reserved.
//

import UIKit
protocol PhotoDetailDelegate {
    func newPhoto(imageData: Data, title: String)
}
class PhotoDetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var delegate: PhotoDetailDelegate?
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        updateViews()
        
        
    }
    
    func setTheme() {
        guard let theme = themeHelper?.themePreference else { return }
        if theme.description == "Red" {
            view.backgroundColor = UIColor.red
        } else if theme.description == "Black" {
            view.backgroundColor = UIColor.black
        }
    }
    
    
    
    @IBAction func addButtonTapped(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
        
        
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismiss(animated: true, completion: { () -> Void in
            
        })
        
        self.photoImageView.image = image
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let photo = photoImageView.image,
            let data = photo.pngData(),
            let title = textField.text,
            !title.isEmpty else { return }
        
        
        delegate?.newPhoto(imageData: data, title: title)
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateViews() {
        guard let photoData = photo?.imageData,
            let title = photo?.title else {return}
        photoImageView.image = UIImage(data: photoData)
        textField.text = title
    }
    
}
