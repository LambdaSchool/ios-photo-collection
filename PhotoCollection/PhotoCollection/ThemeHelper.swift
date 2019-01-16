//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Jocelyn Stuart on 1/16/19.
//  Copyright © 2019 JS. All rights reserved.
//

import Foundation


class ThemeHelper {
    let themePreferenceKey: String
    
    init(themePreferenceKey: String) {
        self.themePreferenceKey = themePreferenceKey
        
        if themePreferenceKey == nil {
            let userDefaults = UserDefaults.standard
            userDefaults.set("Pink", forKey: themePreferenceKey)
        }
    }
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYourColorHere() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Pink", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        let shouldShowColor = UserDefaults.standard.string(forKey: themePreferenceKey)
        
        if shouldShowColor != nil {
            return shouldShowColor
        } else {
            return nil
        }
        
    }
    
}




/*
 override func viewWillAppear(_ animated: Bool) {
 super.viewWillAppear(animated)
 updateViews()
 }
 
 @IBAction func changeShouldShowPluto(_ sender: UISwitch) {
 let userDefaults = UserDefaults.standard
 userDefaults.set(sender.isOn, forKey: .shouldShowPlutoKey)
 }
 
 private func updateViews() {
 let userDefaults = UserDefaults.standard
 shouldShowPlutoSwitch.isOn = userDefaults.bool(forKey: .shouldShowPlutoKey)
 }
 
 @IBOutlet weak var shouldShowPlutoSwitch: UISwitch!
 
 */
