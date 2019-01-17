//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Cameron Dunn on 1/16/19.
//  Copyright © 2019 Cameron Dunn. All rights reserved.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addPhotoButton : UIButton!
    var photoController : PhotoController?
    var photo : Photo? = Photo(image: nil, title: nil)
    let picker = UIImagePickerController()
    var themeHelper : ThemeHelper?
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        picker.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func addPhoto(_ sender: Any) {
        let photos = PHPhotoLibrary.authorizationStatus()
        if photos == .notDetermined {
            PHPhotoLibrary.requestAuthorization({_ in
                //do nothing
            })
        }
        if PHPhotoLibrary.authorizationStatus() == .authorized{
            self.present(self.picker, animated: true)
        } else {
            let alert = UIAlertController(title: "Error", message: "You have not granted this app permission to your photo gallery. Please do so in your settings.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true)
        }
        
    }
    @IBAction func savePhoto(_ sender: Any) {
        photo!.title = textField.text
        photoController?.create(photo: photo!)
        navigationController?.popViewController(animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image : UIImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        photo!.image = image
        imageView.image = photo?.image
        picker.dismiss(animated: true, completion: nil)
    }
    func setTheme(){
        guard let theme = themeHelper!.themePreference else {return}
        if(theme == .dark){
            self.view.backgroundColor = UIColor.darkGray
        }else if(theme == .light){
            self.view.backgroundColor = UIColor.white
        }
    }
    func updateViews(){
        setTheme()
        if(photo?.image != nil){
            imageView.image = photo!.image
            textField.text = photo!.title
            textField.isEnabled = false
            addPhotoButton.isHidden = true
            navigationItem.rightBarButtonItem?.title = ""
            
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
