//
//  ThemeSelectionViewController.swift
//  Photo Collection
//
//  Created by Kenny on 12/19/19.
//  Copyright © 2019 Hazy Studios. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    @IBAction func selectLightTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToLight()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectDarkTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    var themeHelper: ThemeHelper?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setTheme()
    }
    
    func setTheme() {
        guard let preference = themeHelper?.themePreference else {return}
        self.view.backgroundColor = UIColor(named: preference)
    }
    
}
