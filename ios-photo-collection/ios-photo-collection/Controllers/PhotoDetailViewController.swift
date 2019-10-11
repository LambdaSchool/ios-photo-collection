//
//  PhotoDetailViewController.swift
//  ios-photo-collection
//
//  Created by denis cedeno on 10/10/19.
//  Copyright © 2019 DenCedeno Co. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTextField: UITextField!
    @IBAction func addPhoto(_ sender: Any) {
    }
    @IBAction func savePhoto(_ sender: Any) {
        guard let photo = photo,
            let imageData = detailImageView?.image?.pngData(),
            let text = detailTextField.text,
            ((photoController?.update(photo: photo, data: imageData, string: text)) != nil)
            else {return}
        photoController?.create(imageData: imageData , title: text)
        navigationController?.popViewController(animated: true)
}

    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
       
    func setTheme() {
            guard let themePreference = themeHelper?.themePreference else {return}
        
        if themePreference == "Dark"{
            view.backgroundColor = UIColor.gray
        } else if themePreference == "Color"{
            view.backgroundColor = UIColor.blue
        }
    }
    
    func updateViews(){
        setTheme()
        guard let photo = photo else {return}
        detailImageView.image = UIImage(data: photo.imageData)
        detailTextField.text = photo.title
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
