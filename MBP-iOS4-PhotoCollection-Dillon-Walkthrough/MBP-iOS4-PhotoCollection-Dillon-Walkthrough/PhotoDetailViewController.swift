//
//  PhotoDetailController.swift
//  MBP-iOS4-PhotoCollection-Dillon-Walkthrough
//
//  Created by Vijay Das on 12/6/18.
//  Copyright © 2018 Vijay Das. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var photoTextField: UITextField!
    
    
    @IBAction func addPhoto(_ sender: Any) {
        
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
        
        // instantiate imagePickerController
        let imagePicker = UIImagePickerController()
        
       // assign its source
        imagePicker.sourceType = .photoLibrary
        
        // assign delegate
        imagePicker.delegate = self
        
        // present the picker to user
        present(imagePicker, animated: true)
        


    }
    
   
    @IBAction func savePhoto(_ sender: Any) {
        
        guard let title = photoTextField.text,
        let image = photoImageView.image,
        let imageData = image.pngData() else { return }
        
        PhotoModel.shared.addPhoto(title: title, imageData: imageData)
        navigationController?.popViewController(animated: true)
        
}

    // MARK: - Image Picker Controller
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        defer { picker.dismiss(animated: true) }
        
        guard let image = info[.originalImage] as? UIImage else { return }
        photoImageView.image = image
        
        
        
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

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

}
