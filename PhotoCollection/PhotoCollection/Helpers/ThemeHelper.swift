//
//  ThemeHelper.swift
//  
//
//  Created by Ian Becker on 5/21/20.
//

import Foundation

class ThemeHelper {
    var themePreferenceKey: String = "themePreferenceKey"
    var themePreference: String?
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    func string(forKey themePreferenceKey: String) -> String? {
        return themePreferenceKey
    }
    
    func setThemePreferenceToDark() {
        let defaults = UserDefaults.standard
        
        defaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYourColorHere() {
        let defaults = UserDefaults.standard
        
        defaults.set("Green", forKey: themePreferenceKey)
    }
}

