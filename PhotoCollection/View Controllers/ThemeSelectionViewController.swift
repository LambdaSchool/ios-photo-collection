//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Scott Bennett on 9/13/18.
//  Copyright © 2018 Scott Bennett. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?

    
    @IBAction func selectDarkTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectLightTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToLight()
        dismiss(animated: true, completion: nil)
    }


}
