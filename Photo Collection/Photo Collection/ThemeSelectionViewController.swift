//
//  ThemeSelectionViewController.swift
//  Photo Collection
//
//  Created by Isaac Lyons on 9/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?
    
    //MARK: Actions
    
    @IBAction func selectDarkTheme(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectOrangeTheme(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToOrange()
        dismiss(animated: true, completion: nil)
    }
}
