//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Mark Gerrior on 2/27/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController,
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate {

    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    let 🖼 = UIImagePickerController()

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var theTextField: UITextField!
  
    @IBAction func saveMe(_ sender: Any) {
        // TODO: Unless you use an unwind, a segue always presents a new view controller each time it is called.
        
        // FIXME: The "Save" bar button item's action should either update the photo if it has a value, or create a new instance of photo using the methods in the photoController. "Pop" the view controller afterwards.

        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        🖼.allowsEditing = false
        🖼.sourceType = .photoLibrary
        🖼.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(🖼, animated: true, completion: nil)

        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        🖼.delegate = self

        // Do any additional setup after loading the view.
        setTheme()
        updateViews()
    }
    
    func updateViews() {
        if let data = photo?.imageData,
            let pic = UIImage(data: data) {
            imageView.image = pic
        }
        theTextField.text = photo?.title
    }
    
    func setTheme() {
        var color: UIColor?
        
        switch themeHelper?.themePreference {
        case "Dark":
            color = .darkGray
        case "Blue":
            color = .blue
        default:
            return
        }
        
        self.view.backgroundColor = color
    }

    // MARK: Delegates
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as! Data
        photo?.imageData = chosenImage
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
             
    }
}
