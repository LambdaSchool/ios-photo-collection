//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Gladymir Philippe on 6/11/20.
//  Copyright © 2020 Gladymir Philippe. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailNameTextField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    func setTheme() {
        guard let currentTheme = themeHelper?.themePreference else { return }
        if currentTheme == "Dark" {
            view.backgroundColor = UIColor.darkGray
        } else {
            view.backgroundColor = UIColor.green
        }
    }
    
    func updateViews() {
        setTheme()
        guard let photo = photo else { return }
        detailImageView.image = UIImage(data: photo.imageData)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateViews()
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        detailImageView.image = image
    }
    
    @IBAction func savePhoto(_ sender: Any) {
      guard let newImage = detailImageView.image,
        let pngImage = newImage.pngData(),
        let newTitle = detailNameTextField.text else { return }
        if let photo = photo {
            photoController?.updatePhoto(photo: photo, imageData: pngImage, title: newTitle)
        } else {
            photoController?.createPhoto(imageData: pngImage, title: newTitle)
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
