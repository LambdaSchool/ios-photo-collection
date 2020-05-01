//
//  ThemeSelectionViewController.swift
//  Photo Collection
//
//  Created by Bronson Mullens on 4/30/20.
//  Copyright © 2020 Bronson Mullens. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    // MARK: - IBActions
    @IBAction func selectDarkTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectBlueTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
