//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Lydia Zhang on 2/27/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateViews()
        setTheme()
    }
    
    
    func setTheme() {
        guard let themeHelper = themeHelper?.themePreference else {return}
        
        if themeHelper == "Dark" {
            view.backgroundColor = .darkGray
        } else if themeHelper == "Purple" {
            view.backgroundColor = .purple
        }
    }
    func updateViews() {
        guard let photo = photo else {return}
        imageView.image = UIImage(data: photo.imageData)
        titleTextField.text = photo.title
        
    }
    
    
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
         if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
             imageView.contentMode = .scaleAspectFit
             imageView.image = pickedImage
         }

         dismiss(animated: true, completion: nil)
     }
    
    @IBAction func addPhoto(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
        
    
    
    
    
    
    
    @IBAction func savePhoto(_ sender: Any) {
        guard let photoController1 = photoController, let title = titleTextField.text, let image = imageView.image?.pngData() else {return}
        if let changedPhoto = photo {
            photoController1.update(photo: changedPhoto, imageData: image, title: title)
        } else {
            photoController1.Create(data: image, title: title)
        }
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
