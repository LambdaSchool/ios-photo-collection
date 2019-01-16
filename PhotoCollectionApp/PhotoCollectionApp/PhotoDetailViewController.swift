//
//  ViewController.swift
//  PhotoCollectionApp
//
//  Created by Nelson Gonzalez on 1/16/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var infoTextField: UITextField!
    
    
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateView()
    }

    @IBAction func addPhotoButtonPressed(_ sender: UIButton) {
    }
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
        guard let title = infoTextField.text, !title.isEmpty, let image = photoImageView.image, let imageData = image.pngData() else {return}
        photoController?.createPhotos(with: imageData, and: title)
        navigationController?.popViewController(animated: true)
    }
    
    private func updateView(){
        setTheme()
        
        guard let photo = photo?.imageData else {return}
        
        let image = UIImage(data: photo)
        
        photoImageView.image = image
    }
    
    func setTheme(){
        guard let theme = themeHelper?.themePreference else {return}
        
        switch theme {
        case "Light":
            view.backgroundColor = .white
        case "Dark":
            view.backgroundColor = .darkGray
        default:
            break
        }
        
    }
    
}

