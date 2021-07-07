//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Moin Uddin on 9/6/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
    }
    
    func updateViews() {
        setTheme()
        if let photo = photo {
            photoImageView.image = UIImage(data: photo.imageData)
            titleTextField.text = photo.title
            title = photo.title
        } else {
            title = "New Photo"
            return
        }
    }
    
    func setTheme() {
        guard let color = themeHelper?.themePreference else { return }
        switch color {
        case "Blue":
            view.backgroundColor = UIColor.blue
        case "Dark":
            view.backgroundColor = UIColor.darkGray
        default:
            return
        }
    }
    
    
    @IBAction func addPhoto(_ sender: Any) {
        let preservedStatus = PHPhotoLibrary.authorizationStatus()
        switch preservedStatus {
        case .authorized:
            self.presentImagePickerController()
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({ (newStatus) in
                if newStatus == .authorized {
                    self.presentImagePickerController()
                } else {
                    return
                }
            })
        default:
            return
        }
        
        
    }
    

    @IBAction func savePhoto(_ sender: Any) {
        guard let title = titleTextField.text,
            let photoImage = photoImageView.image,
            let photoData = UIImageJPEGRepresentation(photoImage, 1.0)
            else { return }
        if let photo = photo {
            photoController?.update(photo: photo, title:  title, imageData: photoData)
        } else {
            photoController?.create(title: title, imageData: photoData)
        }
        navigationController?.popViewController(animated: true)
    }
    
    func presentImagePickerController() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            present(imagePicker, animated: true, completion: nil)
        } else {
            return
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }
        
        photoImageView.image = image
        
    }
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    
    var photoController: PhotoController?
    var themeHelper: ThemeHelper?
    var photo: Photo? {
        didSet{
            updateViews()
        }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
