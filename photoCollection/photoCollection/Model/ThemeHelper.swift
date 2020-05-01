//
//  ThemeHelper.swift
//  photoCollection
//
//  Created by Sammy Alvarado on 4/30/20.
//  Copyright © 2020 Sammy Alvarado. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    let themePreferenceKey = "ThemePreference"
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYourColorHere() {
           let userDefaults = UserDefaults.standard
           userDefaults.set("Blue", forKey: themePreferenceKey)
       }
    
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    
}
