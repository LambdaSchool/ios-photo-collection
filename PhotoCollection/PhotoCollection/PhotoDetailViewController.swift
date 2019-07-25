//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Ry Bautista on 7/25/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    lazy var imagePicker = UIImagePickerController()
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = themeHelper?.setTheme()
        updateViews()
        

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
    }
    
    private func updateViews(){
        guard let photo = photo else { return }
        textField.text = photo.title
        imageView.image = UIImage(data: photo.imageData)
        
    }
    

    @IBAction func savePhoto(_ sender: Any) {
        guard let imageData = imageView.image?.pngData(), let title = textField.text, !title.isEmpty else {return}
        let newPhoto = Photo(imageData: imageData, title: title)
        
        if let photo = photo{
            guard let index = photoController?.photos.firstIndex(where: {$0 == photo }) else {return}
            photoController?.photos[index] = newPhoto
        }else {
            
            photoController?.photos.append(newPhoto)
        }
        photoController?.saveToPersistentStorage()
        
        navigationController?.popViewController(animated: true)
    }
    @IBAction func addPhoto(_ sender: Any) {
        present(imagePicker, animated: true)
    }
    

}

extension PhotoDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageView.image = userPickedImage
            imagePicker.dismiss(animated: true, completion: nil)
        }
    }
}
