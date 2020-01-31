//
//  ThemeSettingVC.swift
//  PhotoCollect
//
//  Created by Nick Nguyen on 1/30/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

import UIKit

class ThemeSettingVC: UIViewController {

    var themeHelper : ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func darkThemeTapped(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
 
    
    @IBAction func blueThemeTapped(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToLight()
        dismiss(animated: true, completion: nil)
    }
    
    
}
