//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Nihal Erdal on 3/24/20.
//  Copyright © 2020 Nihal Erdal. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        
        setTheme()
        updateViews()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setTheme(){
        
        let themePreference = themeHelper?.themePreference
        
        if themePreference == "Dark"{
            view.backgroundColor = .darkGray
        }else{
            view.backgroundColor = .blue
        }
    }
    
    func updateViews() {
        
        guard let imageData = photo?.imageData else {return}
        
        imageView.image = UIImage(data: imageData)
        
        nameTextField.text = photo?.title
              
       
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        
        guard let image = imageView.image?.pngData(),
            let name = nameTextField.text else {return}
        
       if let photo = photo {
            photoController?.updatePhoto(photo: photo, imageData: image, title: name)
        }else {
            photoController?.creatPhoto(imageData: image, title: name)
        }
        navigationController?.popViewController(animated: true) //   ?????
    }
    
   
    @IBAction func save(_ sender: Any) {
        
      let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self 
        
    
  
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
extension PhotoDetailViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func didFinishPickingMediaWithInfo(){
        
    }
    
}
