//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Rob Vance on 2/20/20.
//  Copyright © 2020 Rob Vance. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // Mark: IBAction
    @IBAction func selectedDarkTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceDark()
        dismiss(animated: true, completion: nil)
    }
    @IBAction func selectedGreenTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceGreen()
        dismiss(animated: true, completion: nil)
    }
}
