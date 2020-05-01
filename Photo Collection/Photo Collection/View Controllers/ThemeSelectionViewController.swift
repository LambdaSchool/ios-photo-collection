//
//  ThemeSelectionViewController.swift
//  Photo Collection
//
//  Created by Rob Vance on 4/29/20.
//  Copyright © 2020 Robs Creations. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
