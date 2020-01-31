//
//  PhotoDetailViewController.swift
//  iOS Photo Collection
//
//  Created by Nichole Davidson on 1/30/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    
    @IBOutlet weak var addTitleTextField: UITextField!
    @IBOutlet weak var addImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        updateViews()
    }
    
    func setTheme() {
        
        if themeHelper?.themePreferenceKey == "Pine" {
            self.view.backgroundColor = UIColor(red: 0.190, green: 0.264, blue: 0.046, alpha: 1)
        } else {
            self.view.backgroundColor = UIColor.darkGray
        }
    }
    
    
    func updateViews() {
       
        guard let newImage = photo?.imageData else { return }
        let image = UIImage(data: newImage)
        
        addImageView.image = image
    }
    
    
    @IBAction func savePhoto(_ sender: Any) {
        if photo?.imageData != nil {
            updateViews()
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        
        let authorizationStatus = PHPhotoLibrary.authorizationStatus()
        
        switch authorizationStatus {
        case .authorized:
            presentImagePickerController()
            
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization()
        default:
            break
        }
    }
    
   private func presentImagePickerController() {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
        let imagePicker = UIImagePickerController()
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = ingo[UIImagePickerControllerOriginalImage] as? UIImage else { return }
        
        addImageView.image = image
    }
   
    func accessLibrary() {
        
        
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


 
