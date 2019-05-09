//
//  ThemeSelectionViewController.swift
//  Photo Collection
//
//  Created by Jeremy Taylor on 5/9/19.
//  Copyright © 2019 Bytes-Random L.L.C. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    var themeHelper: ThemeHelper?
    
    @IBAction func selectDarkTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectGreenTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToGreen()
        dismiss(animated: true, completion: nil)
    }
}
