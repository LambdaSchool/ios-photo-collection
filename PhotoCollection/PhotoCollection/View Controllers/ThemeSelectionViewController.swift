//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Nathanael Youngren on 1/16/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    @IBAction func selectDarkTheme(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectYellowTheme(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToYellow()
        dismiss(animated: true, completion: nil)
    }
    
    var themeHelper: ThemeHelper?

}
