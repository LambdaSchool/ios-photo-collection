//
//  ThemeSelectionViewController.swift
//  photoCollection
//
//  Created by beth on 1/30/20.
//  Copyright © 2020 elizabeth wingate. All rights reserved.
//

import UIKit

//step 1
class ThemeSelectionViewController: UIViewController {

    //step2
    var themeHelper: ThemeHelper?
    
    
    @IBAction func selectDarkTheme(_ sender: Any) {
        UserDefaults.standard.set(ThemeHelper.PropertyKeys.dark, forKey: .themePreference)
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func selectWhiteTheme(_ sender: Any) {
        UserDefaults.standard.set(ThemeHelper.PropertyKeys.white, forKey: .themePreference)
        themeHelper?.setThemePreferenceToWhite()
        dismiss(animated: true, completion: nil)
    }
    
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

}
