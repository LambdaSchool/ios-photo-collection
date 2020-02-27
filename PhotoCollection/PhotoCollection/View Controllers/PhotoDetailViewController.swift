//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Nichole Davidson on 2/27/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var addImage: UIImageView!
    @IBOutlet weak var addPhotoTitle: UITextField!
    
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()

    }
    
    func setTheme() {
        if themeHelper?.themePreference == "Sienna" {
          self.view.backgroundColor = UIColor(red: 235, green: 100, blue: 100, alpha: 1)
      } else {
          self.view.backgroundColor = UIColor.darkGray
      }
    }
    
    func updateViews() {
        
        guard let newImage = photo?.imageData else { return }
               let image = UIImage(data: newImage)
               
               addImage.image = image
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        
        
        
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        
        if photo?.imageData != nil {
                  updateViews()
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
