//
//  ThemeSelectionViewController.swift
//  Photo Collection
//
//  Created by Harmony Radley on 2/27/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    var themeHelper: ThemeHelper? 
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setTheme() {
        guard let themeHelper = themeHelper?.themePreference else { return }
        
        if themeHelper == "Dark" {
            view.backgroundColor = .darkGray
        } else if themeHelper == "Blue" {
            view.backgroundColor = .blue
        }
    }
    
    @IBAction func selectDarkTheme(_ sender: Any) {
        
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectYourColorHereTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToYourColorHere()
        dismiss(animated: true, completion: nil)
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
