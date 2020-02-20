//
//  ThemeSelectionViewController.swift
//  Photo Collection
//
//  Created by Donella Barcelo on 11/14/19.
//  Copyright © 2019 Donella Barcelo. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func selectDarkTheme(_ sender: Any) {
        UserDefaults.standard.set(ThemeHelper.PropertyKeys.dark, forKey: .themePreference)
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    @IBAction func selectBlueTheme(_ sender: Any) {
        UserDefaults.standard.set(ThemeHelper.PropertyKeys.blue, forKey: .themePreference)
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
}
