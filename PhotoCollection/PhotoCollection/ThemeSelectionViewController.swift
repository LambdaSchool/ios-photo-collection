//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Enrique Gongora on 1/30/20.
//  Copyright © 2020 Enrique Gongora. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    var themeHelper: ThemeHelper?
    @IBAction func selectDarkTheme(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    @IBAction func selectBlueTheme(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToYourColorHere()
        dismiss(animated: true, completion: nil)
    }
}
