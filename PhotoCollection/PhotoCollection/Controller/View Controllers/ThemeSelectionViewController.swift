//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Chad Rutherford on 11/14/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Properties
    var themeHelper: ThemeHelper?
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Actions
    @IBAction func darkModeButtonTapped(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true)
    }
    
    @IBAction func lightModeButtonTapped(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToLight()
        dismiss(animated: true)
    }
}
