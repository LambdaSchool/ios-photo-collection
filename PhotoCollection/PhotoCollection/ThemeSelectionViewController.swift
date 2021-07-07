//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Thomas Cacciatore on 5/9/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func selectDarkTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectOrangeTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToOrange()
        dismiss(animated: true, completion: nil)
    }
    
    
    
    var themeHelper: ThemeHelper?
}
