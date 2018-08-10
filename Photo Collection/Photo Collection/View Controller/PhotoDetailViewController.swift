//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Iyin Raphael on 8/9/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit
import Photos
class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()

        // Do any additional setup after loading the view.
    }
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
  
    
    
    func setTheme(){
        guard let themePreference = themeHelper?.themePreference else {return}
        
        if themePreference == "Blue"{
            view.backgroundColor = UIColor.darkGray
        }else{
            view.backgroundColor = UIColor.blue
        }
    }
    
    
    func updateView(){

        setTheme()
        
        guard isViewLoaded else {return}
        
        if let photo = photo {
            textField.text = photo.title
            imageView.image = UIImage(data: photo.imageData)
            
        }
        
    }
    @IBAction func addPhotoButton(_ sender: Any) {
        PHPhotoLibrary.requestAuthorization { (permission) in
            if permission == .authorized {
                print("User granted us access")
                
                DispatchQueue.main.sync {
                    self.presentImgaeController()
                }
            }
        }
    }
    
    func presentImgaeController(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {return}
        imageView.image = image
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
        
    
    
    
    
    @IBAction func Save(_ sender: Any) {
        guard let title = textField.text,
            let imageData = UIImagePNGRepresentation(imageView.image!) else {return}
        
        if let photo = photo{
            photoController?.updatePhoto(photo: photo, imageData: imageData, title: title)
        }else{
            photoController?.createPhoto(title: title, imageData: imageData)
        }
        
        if let navController = self.navigationController{
            navController.popViewController(animated: true)
            
        }
    }
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
