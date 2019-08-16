//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Vici Shaweddy on 8/15/19.
//  Copyright © 2019 Vici Shaweddy. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()

       updateViews()
    }
    
    private func updateViews() {
        setTheme()
        guard let imageData = photo?.imageData else { return }
        let photo = UIImage(data: imageData)
        imageView.image = photo
    }
    
    private func setTheme() {
        guard let themeColor = themeHelper?.themePreference else { return }
        
        if themeColor == "Dark" {
            view.backgroundColor = .black
        } else if themeColor == "Pink" {
            view.backgroundColor = .purple
        }
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        guard let image = imageView.image,
            let title = textField.text,
            let imageData = image.pngData() else { return }
        if let photo = photo {
            photoController?.update(photo: photo, data: imageData, string: title)
        } else {
            let photo = Photo(imageData: imageData, title: title)
            guard let photoController = photoController else { return }
            photoController.create(photo: photo)
        }
        navigationController?.popViewController(animated: true)
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

extension PhotoDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
            dismiss(animated: true, completion: nil)
        }
    }
}
