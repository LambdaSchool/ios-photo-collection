//
//  ThemeSelectionViewController.swift
//  MBP-iOS4-PhotoCollection-Dillon-Walkthrough
//
//  Created by Vijay Das on 12/6/18.
//  Copyright © 2018 Vijay Das. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    
    @IBAction func setDarkTheme(_ sender: Any) {
        ThemeHelper.shared.setThemePreferenceToDark()
        dismiss(animated: true)
    }
    
    @IBAction func setLightTheme(_ sender: Any) {
        ThemeHelper.shared.setThemePreferenceToLight()
        dismiss(animated: true)
    }
}
