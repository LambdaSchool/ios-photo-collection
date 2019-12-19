//
//  PhotoDetailViewController.swift
//  ios-photo-collection
//
//  Created by user162867 on 12/19/19.
//  Copyright © 2019 user162867. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()

        // Do any additional setup after loading the view.
    }
    
    func setTheme() {
        guard let themePreference = themeHelper?.themePreferenceKey else { return }
        switch themePreference {
        case ThemeHelper.keys.dark:
            view.backgroundColor = .darkGray
        case ThemeHelper.keys.blue:
            view.backgroundColor = .blue
        default:
            view.backgroundColor = .white
        }
    }
    
    func updateViews() {
        setTheme()
        guard let imageData = photo?.imageData else { return }
        
        imageView.image = UIImage(data: imageData)
        textField.text = photo?.title
    }
    

    @IBAction func addPhoto(_ sender: Any) {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
    
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.modalPresentationStyle = UIModalPresentationStyle.currentContext
        present(imagePicker, animated: true, completion: nil)
    
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        guard let title = textField.text,
            let data = imageView.image?.pngData() else { return }
        if let photo = photo {
            photoController?.update(photo: photo, imageData: data, title: title)
        } else {
            photoController?.create(imageData: data, title: title)
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

extension PhotoDetailViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any] ) {
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
        }
        self.dismiss(animated: true, completion: nil)
        return
    }
}
