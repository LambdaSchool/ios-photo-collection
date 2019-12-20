//
//  PhotoDetailController.swift
//  Photo Collection
//
//  Created by Kenny on 12/19/19.
//  Copyright © 2019 Hazy Studios. All rights reserved.
//

import UIKit

class PhotoDetailController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var addPhotoTextField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    //MARK: Helper Methods
    func setTheme() {
        guard let themePreference = themeHelper?.themePreference else {return}
        self.view.backgroundColor = UIColor(named: themePreference)
    }
    
    func updateViews() {
        setTheme()
        if let imageData = photo?.imageData {
            let image = UIImage(data: imageData)
            imgView.image = image
        }
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
