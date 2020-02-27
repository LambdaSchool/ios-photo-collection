//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Lambda_School_Loaner_204 on 10/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    // MARK: - Properties
    
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBActions
    
    @IBAction func selectDarkThemeTapped(_ sender: UIButton) {
        guard let themeHelper = themeHelper else { return }
        
        themeHelper.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectBlueTheme(_ sender: UIButton) {
        guard let themeHelper = themeHelper else { return }
        
        themeHelper.setThemePreferenceToYourColorHere()
        dismiss(animated: true, completion: nil)
    }
}
