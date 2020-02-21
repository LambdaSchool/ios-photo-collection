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
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
        
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("darkGrey", forKey: .themePreferenceDark)
    }
    
    func setThemePreferenceToGreen() {
        UserDefaults.standard.set("systemGreen", forKey: .themePreferenceGreen)
    }
    
    var themePreference: String? {
        let userDefaults = UserDefaults.standard
        let theme = userDefaults.string(forKey: .themePreferenceDark)
        guard let themeKey = theme else { return "" }
        return themeKey
    }
}
