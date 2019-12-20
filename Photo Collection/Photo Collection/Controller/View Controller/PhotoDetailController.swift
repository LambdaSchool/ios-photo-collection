//
//  PhotoDetailController.swift
//  Photo Collection
//
//  Created by Kenny on 12/19/19.
//  Copyright © 2019 Hazy Studios. All rights reserved.
//

import UIKit

class PhotoDetailController: UIViewController, UINavigationControllerDelegate {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var addPhotoTextField: UITextField!
    
    @IBAction func addPhotoBtn(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true)
    }
    
    @IBAction func saveBtn(_ sender: UIBarButtonItem) {
        guard let title = addPhotoTextField.text else {print("no text in textField");return}
        guard let imgData = imgView.image?.pngData() else {print("no image data");return}
        var testImg = UIImage(data: imgData)
        if testImg?.imageOrientation == .left {
            print("this image is rotated")
        }
        let newPhoto = Photo(imageData: imgData, title: title)
        if let photo = photo {
           photoController?.update(photo: photo, data: imgData, name: title)
            print("updating photo")
        } else {
            print("new photo")
            photoController?.create(photo: newPhoto)
        }
        navigationController?.popViewController(animated: true)
    }
    
    let imagePicker = UIImagePickerController()
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    //MARK: Helper Methods
    func setTheme() {
        guard let themePreference = themeHelper?.themePreference else {return}
        self.view.backgroundColor = UIColor(named: themePreference)
    }
    
    func updateViews() {
        setTheme()
        if let imageData = photo?.imageData {
            let image = UIImage(data: imageData)
            imgView.image = image
        }
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

extension PhotoDetailController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imgView.contentMode = .scaleAspectFit
            imgView.image = pickedImage
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
}
