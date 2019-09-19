//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Jesse Ruiz on 9/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var photoDetailImage: UIImageView!
    @IBOutlet weak var photoDetailTextField: UITextField!
    
    // MARK: - Properties
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    // MARK: - Methods
    func setTheme() {
        guard let currentTheme = themeHelper?.themePreference else { return }
        if currentTheme == "Dark" {
            view.backgroundColor = UIColor.darkGray
        } else {
            view.backgroundColor = UIColor.magenta
        }
    }
    
    func updateViews() {
        setTheme()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - Actions
    @IBAction func addPhoto(_ sender: UIButton) {
    }
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
    }
    

}
