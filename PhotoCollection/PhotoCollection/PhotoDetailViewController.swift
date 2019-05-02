//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Jeffrey Carpenter on 5/2/19.
//  Copyright © 2019 Jeffrey Carpenter. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    @IBOutlet weak var addPhotoImageView: UIImageView!
    @IBOutlet weak var photoTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateViews()
    }
    
    
    func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        switch themePreference {
        case "Dark":
            view.backgroundColor = .gray
        case "Red":
            view.backgroundColor = .magenta
        default :
            return
        }
    }
    
    func updateViews() {
        setTheme()
        if let photo = photo {
            addPhotoImageView.image = UIImage(data: photo.imageData)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
    }
    
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
       
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
