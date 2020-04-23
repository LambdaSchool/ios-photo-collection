//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Kelson Hartle on 4/23/20.
//  Copyright © 2020 Kelson Hartle. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    
    //MARK: - Actions
    @IBAction func selectDarkTheme(_ sender: UIButton) {
        
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func selectYourColorHereTheme(_ sender: UIButton) {
        
        themeHelper?.setThmePrefernceToYourColorHere()
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: - Properties

    var themeHelper: ThemeHelper?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
