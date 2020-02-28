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
  
    @IBAction func save(_ sender: Any) {
        // TODO: Unless you use an unwind, a segue always presents a new view controller each time it is called.
        if let title = theTextField?.text,
            let imageData = imageView.image?.pngData() {
            
            if photo == nil {
                photoController?.create(title: title, image: imageData)
            } else {
                photoController?.update(pic: photo!, title: title, image: imageData)
            }
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        🖼.allowsEditing = false
        🖼.delegate = self
        present(🖼, animated: true)
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

        if let image = info[.originalImage] as? UIImage {
            
            imageView.image = image
        }
        
        // TODO: Why did call this remove PhotoDetailViewController?
        // navigationController?.popViewController(animated: true)

        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
             
        navigationController?.popViewController(animated: true)
    }
}
