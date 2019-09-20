//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by macbook on 9/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    // MARK: - Properties
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    
    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    
    // VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

        
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
    }
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
    }
    
    
    
    //MARK: - SET Theme function
    func setTheme() {
        guard let theme = themeHelper?.themePreference else { return }
        
        if theme == "Dark" {
            view.backgroundColor = .darkGray
        }
        else if theme == "Green" {
            view.backgroundColor = .green
        } else { return }
    }
    
    
    func updateViews() {
        setTheme()
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
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
