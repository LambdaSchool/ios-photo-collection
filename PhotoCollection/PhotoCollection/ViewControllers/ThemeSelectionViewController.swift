//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Carolyn Lea on 8/2/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController
{
    @IBOutlet weak var themeOneButton: UIButton!
    @IBOutlet weak var themeTwoButton: UIButton!
    
    //var themeHelper: ThemeHelper?
    let themePreferenceKey = "ThemePreferenceKey"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    @IBAction func selectDarkTheme(_ sender: Any)
    {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
        //themeHelper?.setThemePreferenceToDark()
    }
    
    @IBAction func selectPinkTheme(_ sender: Any)
    {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Pink", forKey: themePreferenceKey)
        //themeHelper?.setThemePreferenceToPink()
    }
    
    
}
