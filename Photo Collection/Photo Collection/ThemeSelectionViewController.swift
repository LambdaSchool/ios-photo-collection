//
//  ThemeSelectionViewController.swift
//  Photo Collection
//
//  Created by Wyatt Harrell on 2/27/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func selectLightThemeButtonTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToLight()
        dismiss(animated: true, completion: nil)
        
    }
    

    @IBAction func selectDarkThemeButtonTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
}
