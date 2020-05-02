//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Dawn Jones on 4/30/20.
//  Copyright © 2020 Dawn Jones. All rights reserved.
//

import UIKit

protocol ThemeDelegate: class {
    func didChangeTheme()
}

class ThemeSelectionViewController: UIViewController {
    
    weak var delegate: ThemeDelegate?
    
    var themeHelper: ThemeHelper?
    
    @IBAction func selectDarkTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        print("New theme is: \(String(describing: themeHelper?.themePreference))")
        delegate?.didChangeTheme()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectGreenTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToGreen()
        print("New theme is: \(String(describing: themeHelper?.themePreference))")
        delegate?.didChangeTheme()
        dismiss(animated: true, completion: nil)
    }

}
