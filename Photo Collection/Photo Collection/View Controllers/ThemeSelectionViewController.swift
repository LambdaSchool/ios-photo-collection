//
//  ThemeSelectionViewController.swift
//  Photo Collection
//
//  Created by Jesse Ruiz on 9/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    // MARK: - Properties
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions
//    @IBAction func selectDarkTheme(_ sender: UIButton) {
//        themeHelper?.setThemePreferenceToDark()
//        dismiss(animated: true, completion: nil)
//    }
//
//    @IBAction func selectMagentaTheme(_ sender: UIButton) {
//        themeHelper?.setThemePreferenceToMagenta()
//        dismiss(animated: true, completion: nil)
//    }
    
    @IBAction func selectDarkMode(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectMagentaMode(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToMagenta()
        dismiss(animated: true, completion: nil)
    }
}
