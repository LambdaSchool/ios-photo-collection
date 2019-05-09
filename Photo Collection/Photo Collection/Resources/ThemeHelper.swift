//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Jeremy Taylor on 5/9/19.
//  Copyright © 2019 Bytes-Random L.L.C. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey = "themePreferenceKey"
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToGreen() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Green", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: themePreferenceKey)
    }
    
    init() {
        guard (themePreference != nil) else {
            setThemePreferenceToDark()
            return
        }
    }
}
