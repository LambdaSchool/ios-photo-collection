//
//  ThemeSelectionViewController.swift
//  PhotoCollectionApp
//
//  Created by Nelson Gonzalez on 1/16/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectDarkThemeButton(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectLightThemeButton(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToLight()
        dismiss(animated: true, completion: nil)
    }
   
}
