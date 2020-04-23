//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Kelson Hartle on 4/23/20.
//  Copyright © 2020 Kelson Hartle. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var createPhotoImage: UIImageView!
    @IBOutlet weak var createPhotoTextField: UITextField!
    
    
    //MARK: - Actions
    @IBAction func addPhoto(_ sender: UIButton) {
        
        guard let photo = photo else { return }
        
        
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        guard let photo = photo else { return }
        
        photoController?.createPhoto(imageData: photo.imageData, title: photo.title)
        
    }
    
    //MARK: - Properties
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()

        setTheme()
        updateViews()
    }
    
    
    // MARK: - Functions
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        
        createPhotoImage.image = image
        
    }
    func setTheme() {
        let setTheme = themeHelper?.themePreference
        
        switch setTheme {
        case "Blue":
            view.backgroundColor = UIColor.blue
        default:
            view.backgroundColor = UIColor.darkGray
        }
        
    }
    
    func updateViews() {
        
        guard let photo = photo else { return }
        
        createPhotoImage.image = UIImage(data: photo.imageData)

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
