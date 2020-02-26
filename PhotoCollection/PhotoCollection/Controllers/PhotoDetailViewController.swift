//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Karen Rodriguez on 2/26/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        updateViews()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Action Buttons
    @IBAction func addPhoto(_ sender: Any) {
    }
    @IBAction func savePhoto(_ sender: Any) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    //MARK: - Methods
     func setTheme() {
        guard let preference = self.themeHelper?.themePreference else {return}
           
           if preference == "Dark" {
            self.view.backgroundColor = .black
           } else {
               self.view.backgroundColor = .black
            
            }
       }
    func updateViews() {
        guard let photo = self.photo else {return}
        textField.text = photo.title
        
        imageView.image = UIImage(data: photo.imageData)
    }
}
