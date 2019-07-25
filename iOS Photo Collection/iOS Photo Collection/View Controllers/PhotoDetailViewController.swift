//
//  PhotoDetailViewController.swift
//  iOS Photo Collection
//
//  Created by Steven Leyva on 7/25/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    //
    // MARK: - IBOutlets and Properties
    //
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    //
    //MARK: - View LifeCycle
    //

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
       
    }
    func setTheme() {
        guard let theme = themeHelper?.themePreference else { return }
        
        if theme == "Dark" {
            view.backgroundColor = .darkGray
        } else if theme == "Blue" {
            view.backgroundColor = .blue
        }
    }
    
    func updateViews() {
        setTheme()
        guard let photo = photo else { return }
        
        imageView.image = UIImage(data: photo.ImageData)
        textField.text = photo.title
    }
    
    
    //
    //MARK: - IBActions and Methods
    //
    
    @IBAction func addPhoto(_ sender: UIButton) {
    }
    @IBAction func sveButtonTapped(_ sender: UIBarButtonItem) {
        
        guard let photoController = photoController, let title = textField.text, let newPhoto = imageView.image?.pngData() else { return }
        if photo == nil {
           photoController.createPhoto(image: newPhoto, title: title)
        } else {
            guard let photo = photo else { return }
            photoController.update(photo: photo, image: newPhoto, title: photo.title)
            
        }
        navigationController?.popViewController(animated: true)
    }
    
    /*
     //
     // MARK: - Navigation
     //

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
