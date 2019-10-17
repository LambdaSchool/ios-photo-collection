//
//  ThemeSelectionViewController.swift
//  Photo Collection
//
//  Created by morse on 10/17/19.
//  Copyright © 2019 morse. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectDarkTheme(_ sender: Any) {
//        let userDefaults = UserDefaults.standard
//        userDefaults.set(ThemeHelper.PropertyKeys.dark, forKey: .themeKey)
        themeHelper?.setThemePreferenceToDark()
//        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectPurpleTheme(_ sender: Any) {
//        let userDefaults = UserDefaults.standard
//        userDefaults.set(ThemeHelper.PropertyKeys.purple, forKey: .themeKey)
        themeHelper?.setThemePreferenceToPurple()
//        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
