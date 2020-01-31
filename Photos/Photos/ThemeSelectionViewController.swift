//
//  ThemeSelectionViewController.swift
//  Photos
//
//  Created by scott harris on 1/30/20.
//  Copyright © 2020 scott harris. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectDarkTheme(_ sender: Any) {
        if let themeHelper = themeHelper {
            themeHelper.setThemePreferenceToDark()
            dismiss(animated: true)
            
        }
        
    }
    
    @IBAction func selectLightTheme(_ sender: Any) {
        if let themeHelper = themeHelper {
            themeHelper.setThemePreferenceToLight()
            dismiss(animated: true)
            
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
