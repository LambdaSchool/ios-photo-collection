//
//  PhotoDetailViewController.swift
//  ios-photo-collection
//
//  Created by denis cedeno on 10/10/19.
//  Copyright © 2019 DenCedeno Co. All rights reserved.
//

import UIKit

protocol PhotoPickerDelagte {
    func photoIsPicked(_ photo: UIImagePickerControllerDelegate)
}

class PhotoDetailViewController: UIViewController {
    
 var photoController: PhotoController?
  var photo: Photo?
  var themeHelper: ThemeHelper?
  var delegate: PhotoPickerDelagte?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func setTheme() {
            guard let themePreference = themeHelper?.themePreference else {return}
        
        if themePreference == "Dark"{
            view.backgroundColor = UIColor.gray
        } else if themePreference == "Color"{
            view.backgroundColor = UIColor.blue
        }
    }
    
    func updateViews(){
        setTheme()
        guard let photo = photo else {return}
        detailImageView.image = UIImage(data: photo.imageData)
        detailTextField.text = photo.title
    }
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTextField: UITextField!
    @IBAction func addPhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func savePhoto(_ sender: Any) {
        guard let imageData = detailImageView?.image?.pngData(),
            let text = detailTextField.text else {return}
        
        if let photo = photo {
        photoController?.update(photo: photo, data: imageData, string: text)
        navigationController?.popViewController(animated: true)
        }else {
        
        photoController?.create(imageData: imageData , title: text)
        navigationController?.popViewController(animated: true)
        }
    
    }
}

extension PhotoDetailViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let imageURL = info[.imageURL] as? URL else {return}
        
        guard let data = try? Data.init(contentsOf: imageURL) else {return}
        detailImageView.image = UIImage(data: data)
        dismiss(animated: true, completion: nil)
    }
}

extension PhotoDetailViewController: UINavigationControllerDelegate {
    
}
