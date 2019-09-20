//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Gi Pyo Kim on 9/19/19.
//  Copyright © 2019 GIPGIP Studio. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    // MARK: - Properties
    var themeHelper: ThemeHelper?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func selectDarkTheme(_ sender: Any) {
        guard let themeHelper = themeHelper else { return }
        
        themeHelper.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func selectRandomTheme(_ sender: Any) {
        guard let themeHelper = themeHelper else { return }
        
        themeHelper.setThemePreferenceToRandom()
        dismiss(animated: true, completion: nil)
    }
    
}
