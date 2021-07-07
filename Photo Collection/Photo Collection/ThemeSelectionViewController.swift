//
//  ThemeSelectionViewController.swift
//  Photo Collection
//
//  Created by Moses Robinson on 1/16/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    @IBAction func selectDarkTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectPurpleTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToPurple()
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Properties
    
    var themeHelper: ThemeHelper?
}
