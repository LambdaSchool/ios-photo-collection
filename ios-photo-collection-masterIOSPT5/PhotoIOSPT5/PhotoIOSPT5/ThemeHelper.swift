//
//  ThemeHelper.swift
//  PhotoIOSPT5
//
//  Created by David Williams on 2/19/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    var themePreferenceKey: String = "Dark"
    
    init() {
        if (UserDefaults.standard.string(forKey: .themePreferenceDark) != nil) {
            themePreferenceKey = "Dark"
        } else if (UserDefaults.standard.string(forKey: .themePreferenceGreen) != nil) {
            themePreferenceKey = "Green"
        }
          print("at the ThemeHelper init")
            setThemePreferenceToDark()
    }
        
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: .themePreferenceDark)
        print("DarkEm")
    }
    
    func setThemePreferenceToGreen() {
        UserDefaults.standard.set("Green", forKey: .themePreferenceGreen)
        print("GreenEm")
    }
    
    var themePreference: String? {
        let userDefaults = UserDefaults.standard
        let theme = userDefaults.string(forKey: themePreferenceKey)
        guard let themeKey = theme else { return "" }
        return themeKey
    }
}
