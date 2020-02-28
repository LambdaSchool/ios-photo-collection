//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Shawn James on 2/27/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - Properties
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    // MARK: - Outlets
    @IBOutlet weak var addImageView: UIImageView!
    @IBOutlet weak var addTitleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        setTheme()
    }
    
    
    // MARK: - Actions
    @IBAction func addPhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.mediaTypes = ["public.image"]
        present(imagePicker, animated: true)
    }
    
    @IBAction func savePhoto(_ sender: Any) {
            if let photo = photo {
                if let photoController = photoController {
                    if let title = addTitleTextField.text, !title.isEmpty, let data = addImageView.image?.pngData() {
                        photoController.update(photo: photo, imageData: data, title: title)
                    }
                }
            } else {
                if let photoController = photoController {
                    if let title = addTitleTextField.text, !title.isEmpty {
                        let data1 = addImageView.image?.jpegData(compressionQuality: 1)
                        photoController.create(imageData: data1!, title: title)
                    }
                }
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

    func setTheme() {
        guard let themeHelper = themeHelper else { return }
        switch themeHelper.themePreference {
        case ThemeHelper.redTheme:
            view.backgroundColor = .red
        default:
            view.backgroundColor = .blue
        }
    }
}

extension PhotoDetailViewController {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        addImageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        picker.dismiss(animated: true)
    }
    
    func updateViews() {
        guard let photo = photo, let image = UIImage(data: photo.imageData) else { return }
        addImageView.image = image
        addTitleTextField.text = photo.title
    }
}
