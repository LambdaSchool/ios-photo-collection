//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Dennis Rudolph on 10/17/19.
//  Copyright © 2019 LambdaSchool. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func selectDarkTheme(sender: UIButton) {
        guard let themeHelper = themeHelper else { return }
        themeHelper.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectBlueTheme(sender: UIButton) {
        guard let themeHelper = themeHelper else { return }
        themeHelper.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
}
