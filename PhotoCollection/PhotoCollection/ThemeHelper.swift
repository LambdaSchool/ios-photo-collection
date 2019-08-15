//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Vici Shaweddy on 8/14/19.
//  Copyright © 2019 Vici Shaweddy. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey = "themePreference"
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToPink() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Pink", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToPink()
        }
    }
}
