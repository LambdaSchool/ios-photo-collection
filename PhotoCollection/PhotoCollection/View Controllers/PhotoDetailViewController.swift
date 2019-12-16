//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by David Wright on 12/12/19.
//  Copyright © 2019 David Wright. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    // MARK: Properties

    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    // MARK: IBOutlets

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    
    // MARK: IBActions

    @IBAction func addPhoto(_ sender: UIButton) {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
        
        let pickerController = UIImagePickerController()
        pickerController.sourceType = .photoLibrary
        pickerController.delegate = self
        pickerController.modalPresentationStyle = UIModalPresentationStyle.currentContext
        
        present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
        if let imageData = imageView.image?.pngData(),
            let title = titleTextField.text {
            if let photo = photo {
                photoController?.updatePhoto(photo: photo, newImageData: imageData, newTitle: title)
            } else {
                photoController?.createPhoto(from: imageData, title: title)
            }
        }
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: Methods
    
    func setTheme() {
        guard let themeHelper = themeHelper else { return }
        view.backgroundColor = themeHelper.themeColor
    }

    func updateViews() {
        setTheme()
        
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
        titleTextField.text = photo.title
        print(photo.title)
        print(titleTextField.text ?? "nil")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

}

extension PhotoDetailViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
        }
        self.dismiss(animated: true, completion: nil)
        return
    }
}
