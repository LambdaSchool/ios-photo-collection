//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Jeffrey Carpenter on 5/2/19.
//  Copyright © 2019 Jeffrey Carpenter. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    @IBOutlet weak var addPhotoImageView: UIImageView!
    @IBOutlet weak var photoTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateViews()
    }
    
    func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        switch themePreference {
        case "Dark":
            view.backgroundColor = .gray
        case "Red":
            view.backgroundColor = .magenta
        default :
            return
        }
    }
    
    func updateViews() {
        setTheme()
        if let photo = photo {
            addPhotoImageView.image = UIImage(data: photo.imageData)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[.originalImage] as? UIImage else { return }
        
        addPhotoImageView.image = image
    }
    
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
        guard let title = photoTextField.text,
        let photoData = addPhotoImageView.image!.pngData()
        else { return }
        photoController?.createPhoto(title: title, image: photoData)
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
        print("add photo button pressed")
        let pickerVC = UIImagePickerController()
        pickerVC.sourceType = .photoLibrary
        pickerVC.allowsEditing = false
        pickerVC.delegate = self
        present(pickerVC, animated: true, completion: nil)
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
