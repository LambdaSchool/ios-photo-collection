//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Bling Morley on 3/26/20.
//  Copyright © 2020 Cody Morley. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    //OUTLETS
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    
    
    //DELEGATES
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    
    
    //ACTIONS AND FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

        // Do any additional setup after loading the view.
    }
        
    @IBAction func addPhoto(_ sender: Any) {
        
    }
    
    @IBAction func save(_ sender: Any) {
        guard let image = detailImageView.image?.pngData(), let title = textField.text else { return }
        photoController?.create(imageData: image, title: title)
        if let photo = photo {
            photoController?.update(imageData: photo, with: image, and: title)
        } else {
            photoController?.createPhoto(imageData: image, title: title)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    
    
    func setTheme () {
        guard let themeSetting = themeHelper?.themePreference else { return }
        if themeSetting == "Dark" {
            self.view.backgroundColor = UIColor.darkGray
        } else if themeSetting == "Blue" {
            self.view.backgroundColor = .blue
        }
    }
    
    func updateViews() {
        guard let photo = photo else { return }
        
        title = photo.title
        
        detailImageView.image = UIImage(data: photo.imageData)
        
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
