//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Shawn James on 3/26/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    // MARK: - Outlets
    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var imageNameTextField: UITextField!
    
    
    // MARK: - Properties
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setTheme()
        updateViews()
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
            photoController?.Update(photo: photo, data: photo.imageData, title: photo.title)
        } else {
            guard let data = photoView.image?.jpegData(compressionQuality: 1) else { return }
            photoController?.Create(data: data, title: imageNameTextField.text ?? "No Name")
        }
        navigationController?.popViewController(animated: true)
    }
    

    // MARK: - Methods
    
    func setTheme() {
        guard let theme = themeHelper?.themePreference else { return }
        if theme == String.redTheme { view.backgroundColor = .red } else { view.backgroundColor = .blue }
    }
    
    func updateViews() {
        guard let photo = photo else { return }
        photoView.image = UIImage(data: photo.imageData)
        imageNameTextField.text = photo.title
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

extension PhotoDetailViewController {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        photoView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        picker.dismiss(animated: true)
    }
}
