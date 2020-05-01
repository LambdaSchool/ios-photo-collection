//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Bohdan Tkachenko on 4/30/20.
//  Copyright © 2020 Bohdan Tkachenko. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?
   

//    UserDefaults.standard.set(sender.isOn, forKey: .shouldShowPlutoKey) //better to use hard-coded value for key. .shouldShowPlutoKey - declared in extension of String
//           delegate?.didTogglePluto()
    @IBAction func selectRedThemeButtonPressed(_ sender: UIButton) {
       
        themeHelper?.setThemePreferenceToRed()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectDarkThemeButtonPressed(_ sender: UIButton) {
        themeHelper?.setThemePreferenceDark()
        self.dismiss(animated: true, completion: nil)
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
