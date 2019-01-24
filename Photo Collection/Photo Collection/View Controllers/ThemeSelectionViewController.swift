//
//  ThemeSelectionViewController.swift
//  Photo Collection
//
//  Created by Stuart on 1/23/19.
//  Copyright © 2019 Stuart. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    // IBActions & Logic
    
    @IBAction func selectDarkTheme(_ sender: UIButton) {
        themeHelper.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectAquaTheme(_ sender: UIButton) {
        themeHelper.setThemePreferenceToAqua()
        dismiss(animated: true, completion: nil)
    }
    
    func setTheme() {
        
    }
    
    // MARK: - Properties
    
    let themeHelper = ThemeHelper()
}
