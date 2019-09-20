//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Gi Pyo Kim on 9/19/19.
//  Copyright © 2019 GIPGIP Studio. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UINavigationControllerDelegate {
    // MARK: Properties
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
//    let pickerController = UIImagePickerController()
    
    @IBOutlet weak var navigationTitle: UINavigationItem!
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoTextField: UITextField!
    
    // MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        pickerController.delegate = self
//        pickerController.allowsEditing = true
//        pickerController.mediaTypes = ["public.image", "public.movie"]
//        pickerController.sourceType = .photoLibrary
        
        updateViews()
    }
    
    func setTheme() {
        guard let themeHelper = themeHelper, let themePreference = themeHelper.themePreference else { return }
        
        switch themePreference {
        case "Dark":
            view.backgroundColor = UIColor(hue: 360, saturation: 0, brightness: 8, alpha: 1)
        case "Random":
            view.backgroundColor = UIColor(hue: CGFloat(themeHelper.hueValue), saturation: 70, brightness: 70, alpha: 1)
        default:
            print("Invalid themePreference")
            return
        }
    }
    
    func updateViews() {
        setTheme()
        if let photo = photo {
            photoImageView.image = UIImage(data: photo.imageData)
            photoTextField.text = photo.title
        }
    }

    @IBAction func addPhotoTabbed(_ sender: UIButton) {
        
    }
    
    @IBAction func saveTabbed(_ sender: UIBarButtonItem) {
        if let photo = photo,
            let photoController = photoController,
            let imageData = photoImageView.image?.pngData(),
            let title = photoTextField.text,
            !title.isEmpty {
                photoController.update(photo: photo, imageData: imageData, title: title)
                navigationController?.popViewController(animated: true)
        } else if photo == nil,
            let photoController = photoController,
            let imageData = photoImageView.image?.pngData(),
            let title = photoTextField.text,
            !title.isEmpty {
            photoController.create(imageData: imageData, title: title)
            navigationController?.popViewController(animated: true)
        }
    }
}

//extension PhotoDetailViewController: UIImagePickerControllerDelegate {
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        guard let image = info[.editedImage] as? UIImage else { pickerController(picker, didSelect: nil) }
//
//        pickerController(picker, didSelect: image)
//    }
//}
