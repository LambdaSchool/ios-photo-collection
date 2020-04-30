//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Bronson Mullens on 4/30/20.
//  Copyright © 2020 Bronson Mullens. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey: String = "Dark"
    let userDefaults = UserDefaults.standard
    
    var themePreference: String? {
        return userDefaults.string(forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToDark() {
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        userDefaults.set("Blue", forKey: themePreferenceKey)
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToBlue()
        }
    }
    
}
