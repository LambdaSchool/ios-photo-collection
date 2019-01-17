//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Jocelyn Stuart on 1/16/19.
//  Copyright © 2019 JS. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        
        
        // Do any additional setup after loading the view.
    }
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    func setTheme() {
        guard let theme = themeHelper?.themePreference else { return }
        
        if theme == "Blue" {
            view.backgroundColor = .blue
        } else if theme == "Dark" {
            view.backgroundColor = .gray
        }
        
    }
    
    func updateViews() {
        setTheme()
        guard let photo = photo else { return }
        
        imageView.image = UIImage(data: photo.imageData)
        titleTextField.text = photo.title
    }
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    
    @IBAction func addPhoto(_ sender: UIButton) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
        
        guard let photoTitle = titleTextField.text, !photoTitle.isEmpty,
            let photoView = imageView.image,
            let photoData = photoView.pngData() else {return}
        
        if let photo = photo {
            photoController?.update(photo: photo, imageContainer: photoData, imageTitle: photoTitle)
            navigationItem.title = "Update photo"
            
            
        } else {
            photoController?.create(imageContainer: photoData, imageTitle: photoTitle)
            
            titleTextField.text = nil
            imageView.image = nil
            navigationItem.title = "Add a photo"
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - UIImagePickerControllerDelegate Methods
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let original = info[.originalImage] as? UIImage else { return }
        //imageView.contentMode = .scaleAspectFit
        imageView.image = original
        
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
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
