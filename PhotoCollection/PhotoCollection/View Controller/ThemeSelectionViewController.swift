//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Norlan Tibanear on 6/11/20.
//  Copyright © 2020 Norlan Tibanear. All rights reserved.
//

import UIKit

//protocol ThemeSelectionDelegate {
//    func themeWasUpdate()
//}

class ThemeSelectionViewController: UIViewController {
    
    // Outlets
    
    
    // Properties Var
    var themeHelper: ThemHelper?
//    var delegate: ThemeSelectionDelegate?
    
    
    @IBAction func selectDarkThemeBtn(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToDark()
//        delegate?.themeWasUpdate()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectLightThemeBtn(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToLight()
//        delegate?.themeWasUpdate()
        dismiss(animated: true, completion: nil)
    }
    

} // END
