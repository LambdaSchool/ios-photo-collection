//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Christopher Aronson on 5/2/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func addPhotoButtonPressed(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.mediaTypes = ["public.image"]
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
        updateViews()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.editedImage] as? UIImage else {return}
        imageView.image = image
    }
    
    @IBAction func saveItemPressed(_ sender: Any) {
        
        
        print("Saved")
        
        guard let image = imageView.image?.pngData() else {return}
        guard let title = textField.text else {return}
        photoController?.createPhoto(photo: Photo(imageData: image, title: title))
       
//        if photo == nil {
//            guard let imageData = imageView.image?.pngData(),
//            let title = textField.text
//            else {return}
//
//            photoController?.createPhoto(photo: Photo(imageData: imageData, title: title))
//        } else {
//            guard let photo = photo else {return}
//            photoController?.update(photo: photo, data: photo.imageData, title: photo.title)
//        }
//
       self.navigationController?.popViewController(animated: true)
    }
    
    func updateViews() {
        setTheme()
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
        textField.text = photo.title
    }
    
    
    func setTheme() {
        guard let theme = themeHelper?.themePreference else { return }
        
        if theme == "Dark" {
            self.view.backgroundColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)
        } else {
            self.view.backgroundColor = #colorLiteral(red: 0.2272256538, green: 0.5468909038, blue: 0.9551692034, alpha: 1)
        }
    }
}
