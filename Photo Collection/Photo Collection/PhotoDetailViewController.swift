//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Daniela Parra on 9/6/18.
//  Copyright © 2018 Daniela Parra. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    func setTheme() {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
     
     you do it in the “didFinishPickingMediaWithInfo method
     You have to adopt UIImagePickerControllerDelegate
     
     From Jason Modisett to Everyone: (07:34 PM)
     
     picker.dismiss(animated: true, completion: nil)                  guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }                  photoImageView.image = image
     
    */
    
    @IBAction func savePhoto(_ sender: Any) {
    }
    
    @IBAction func addPhoto(_ sender: Any) {
    }
    
    var photo: Photo?
    var photoController: PhotoController?
    var themeHelper: ThemeHelper?
    
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    
}
