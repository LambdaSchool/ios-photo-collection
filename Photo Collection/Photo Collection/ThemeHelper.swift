//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Dillon P on 8/15/19.
//  Copyright © 2019 Dillon P. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    var themePreference: String? {
        let themePreference = UserDefaults.standard.string(forKey: themePreferenceKey)
        return themePreference
    }
    
    let themePreferenceKey: String = "kThemePreference"
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToTeal() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Teal", forKey: themePreferenceKey)
    }
    
}
