//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Claudia Contreras on 2/20/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var photoTitleTextField: UITextField!
    
    
    //MARK: - Properties
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        updateViews()
    }
    
    //MARK: - IBActions
    @IBAction func addPhotoButtonTapped(_ sender: Any) {
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        photoController.
    }
    
    
    //MARK: - Functions
    func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        print("Theme Preference: \(themePreference)")
        //Change the view's background color
    }
    
    func updateViews() {
        guard let photo = photo else { return }
        photoTitleTextField.text = photo.title
        photoImageView.image = UIImage(data: photo.imageData)
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
