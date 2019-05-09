//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Jonathan Ferrer on 5/9/19.
//  Copyright © 2019 Jonathan Ferrer. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

    }

    func updateViews() {
        setTheme()
        if let photo = photo {
            photoImageView.image = UIImage(data: photo.imageData)
        }
    }

    func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        switch themePreference {
        case "Dark":
            view.backgroundColor = #colorLiteral(red: 0.1215686275, green: 0.1294117647, blue: 0.1411764706, alpha: 1)
        case "Green":
            view.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        default :
            return
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.editedImage] as? UIImage else {return}
        photoImageView.image = image
    }

    @IBAction func addPhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        guard let title = photoTextField.text else {
            print("Error: no title")
            return
        }
        guard let image = photoImageView.image else {
            print("Error: there is no image in the view.")
            return
        }
        guard let imageData = image.pngData() else {
            print("Error: image could not be converted to data")
            return
        }
        photoController?.createPhoto(imageData: imageData, title: title)
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

    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoTextField: UITextField!
}
