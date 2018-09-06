//
//  PhotoViewController.swift
//  PhotoCollection
//
//  Created by Farhan on 9/6/18.
//  Copyright © 2018 Farhan. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textField: UITextField!

    
    var photoController: PhotoController?
    var photo: Photo?{
        didSet {
            updateViews()
        }
    }
    var themeHelper: ThemeHelper?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateViews()
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            present(imagePicker, animated: true, completion: nil)
        }
        
//        imagePickerController(imagePicker, didFinishPickingMediaWithInfo: [String : Any])
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }
        imageView.image = image
        
    }
    
    @IBAction func savePhoto(_ sender: Any) {
    
        
        if let photo = photo{
            photoController?.updatePhoto(photoToUpdate: photo, newImage: photo.imageData, newTitle: photo.title)
        } else {
            guard let imageViewImage = imageView.image else {return}
            guard let image = UIImagePNGRepresentation(imageViewImage), let text = textField.text else {return}
            
            photoController?.createPhoto(image: image, title: text)
        }
        
        navigationController?.popViewController(animated: true)
        
    }
    
    func setTheme(){
        
        guard let pref = themeHelper?.themePreference else {return}
        
        if pref == "Dark"{
            view.backgroundColor = UIColor.darkGray
        }
        else if pref == "Red"{
            view.backgroundColor = UIColor.red
        }
        
    }
    
    func updateViews (){
    
        setTheme()
        guard let photo = photo else {return}
        let image = UIImage(data: photo.imageData)
        imageView.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
