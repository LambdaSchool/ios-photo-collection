//
//  ThemeSelectionViewController.swift
//  Photo Collection
//
//  Created by Daniela Parra on 9/6/18.
//  Copyright © 2018 Daniela Parra. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    
    @IBAction func selectYellowTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToYellow()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectDarkTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    var themeHelper: ThemeHelper?

}

