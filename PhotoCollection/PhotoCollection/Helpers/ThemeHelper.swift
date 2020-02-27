//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by John Kouris on 8/15/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey = "themePreferenceKey"
    
    var themePreference: String? {
        let userDefaults = UserDefaults.standard
        
        return userDefaults.string(forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        let userDefaults = UserDefaults.standard
        
        userDefaults.set("Blue", forKey: themePreferenceKey)
    }
    
    init() {
        if themePreference == "" {
            setThemePreferenceToDark()
        }
    }
}
