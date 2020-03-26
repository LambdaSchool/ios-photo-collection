//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Hunter Oppel on 3/26/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    // MARK:  Properties
    
    var themeHelper: ThemeHelper?
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    
    @IBAction func selectDarkTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func selectBlueTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToBlue()
        navigationController?.popViewController(animated: true)
    }
    
}
