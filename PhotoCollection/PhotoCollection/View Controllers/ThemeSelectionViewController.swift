//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Joshua Rutkowski on 12/12/19.
//  Copyright © 2019 Joshua Rutkowski. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: - IBActions
    @IBAction func selectDarkTheme(_ sender: Any) {
        UserDefaults.standard.set(ThemeHelper.PropertyKeys.dark, forKey: .themePreference)
         themeHelper?.setThemePreferenceToDark()
         dismiss(animated: true, completion: nil)
    }
    @IBAction func selectBlueTheme(_ sender: Any) {
        UserDefaults.standard.set(ThemeHelper.PropertyKeys.blue, forKey: .themePreference)
         themeHelper?.setThemePreferenceToBlue()
         dismiss(animated: true, completion: nil)
    }
    
}
