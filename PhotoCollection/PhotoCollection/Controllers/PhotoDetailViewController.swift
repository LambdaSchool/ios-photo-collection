//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Karen Rodriguez on 2/26/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        updateViews()
        imagePicker.delegate = self

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Action Buttons
    @IBAction func addPhoto(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
    }
    @IBAction func savePhoto(_ sender: Any) {
        guard let title = textField.text,
        let image = imageView.image?.pngData(),
        let photoController = photoController else { return }
        
        if let photo = photo {
            photoController.update(photo: photo, data: image, title: title)
        } else {
            photoController.create(data: image, title: title)
        }
        self.navigationController?.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    //MARK: - Methods
     func setTheme() {
        guard let preference = self.themeHelper else {return}
           
        if preference.themePreference == "Dark" {
            self.view.backgroundColor = .black
        } else if preference.themePreference == "Green" {
               self.view.backgroundColor = .green
            }
       }
    func updateViews() {
        guard let photo = self.photo else {return}
        textField.text = photo.title
        
        imageView.image = UIImage(data: photo.imageData)
    }
    
    //MARK: - ImagePicker method
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("This was triggered.")
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = pickedImage
            print("We got down here.")
        }
        dismiss(animated: true, completion: nil)
    }
}


