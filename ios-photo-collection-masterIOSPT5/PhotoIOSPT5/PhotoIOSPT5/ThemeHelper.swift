//
//  ThemeHelper.swift
//  PhotoIOSPT5
//
//  Created by David Williams on 2/19/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    var themePreferenceKey: String = ""
    
    init() {
        if themePreference  == "Dark" {
            themePreferenceKey = "Dark"
        } else if themePreferenceKey == "Green" {
            themePreferenceKey = "Green"
        }
    }
        
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: .themePreferenceDark)
      themePreferenceKey = "Dark"
        print("DarkEm")
    }
    
    func setThemePreferenceToGreen() {
        UserDefaults.standard.set("Green", forKey: .themePreferenceGreen)
      themePreferenceKey = "Green"
        print("GreenEm")
    }
    
    var themePreference: String? {
        let userDefaults = UserDefaults.standard
        let theme = userDefaults.string(forKey: themePreferenceKey)
        guard let themeKey = theme else { return "" }
        return themeKey
    }
}
