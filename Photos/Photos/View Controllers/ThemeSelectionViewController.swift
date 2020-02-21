//
//  ThemeSelectionViewController.swift
//  Photos
//
//  Created by Breena Greek on 2/20/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    // MARK: Properties
    var themeHelper: ThemeHelper?
    
    // MARK: IBActions
    @IBAction func selectDarkTheme(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectPurpleTheme(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToPurple()
        dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
