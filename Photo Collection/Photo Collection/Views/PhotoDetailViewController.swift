//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Angel Buenrostro on 1/16/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

        // Do any additional setup after loading the view.
    }
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    var existingPhoto : Bool = true
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func addPhoto(_ sender: UIButton) {
        existingPhoto = false
        let pickerVC = UIImagePickerController()
        pickerVC.sourceType = .photoLibrary
        pickerVC.allowsEditing = true
        pickerVC.delegate = self
        present(pickerVC, animated: true)
        
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        if existingPhoto && imageView.image != nil && textField.text != nil{
            photoController!.Update(photo: photo!, data: (photo?.imageData)!, string: (photo?.title)!)
            self.navigationController?.popToRootViewController(animated: true)
        } else if imageView.image != nil && textField.text != nil {
            let data = imageView.image!.pngData()
            photoController!.Create(imageData: data!, title: textField.text ?? " ")
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func setTheme() {
        if themeHelper!.themePreference != nil {
        self.view.backgroundColor = (themeHelper!.themePreference == "Dark") ? .darkGray : .cyan
        } else {
            self.view.backgroundColor = UIColor.darkGray
        }
    }
    
    func updateViews(){
        setTheme()
        if photo != nil {
            textField.isUserInteractionEnabled = true
            imageView.image = UIImage(data: (photo?.imageData)!)
            textField.text = photo?.title
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = (info[UIImagePickerController.InfoKey.editedImage] as! UIImage)
        textField.isUserInteractionEnabled = true
        picker.dismiss(animated: true, completion: nil)
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//        let collectionVC = segue.destination as! PhotosCollectionViewController
//        collectionVC.photoController.photos = (photoController?.photos)!
//    }

}
