//
//  ThemeSelectionViewController.swift
//  PhotoCollectionView
//
//  Created by Clayton Watkins on 4/29/20.
//  Copyright © 2020 Clayton Watkins. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    //MARK: - Properties
    var themeHelper: ThemeHelper?

    //MARK: - IBActions
    @IBAction func selectDarkTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func selectYourColorHereTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToYourColorHere()
        dismiss(animated: true, completion: nil)
    }
}
