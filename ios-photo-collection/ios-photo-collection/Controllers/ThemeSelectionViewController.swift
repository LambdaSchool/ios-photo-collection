//
//  ThemeSelectionViewController.swift
//  ios-photo-collection
//
//  Created by denis cedeno on 10/10/19.
//  Copyright © 2019 DenCedeno Co. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    @IBAction func selectBlueTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToColor()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectDarkTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        
    }
    
    func setTheme() {
        guard let themePreference = themeHelper?.themePreference else {return}
           
           if themePreference == "Dark"{
               view.backgroundColor = UIColor.gray
           } else if themePreference == "Color"{
               view.backgroundColor = UIColor.blue
           }
       }

}
