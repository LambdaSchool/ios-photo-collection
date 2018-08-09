//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Lisa Sampson on 8/9/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    let themePreferenceKey: String = "ThemePreference"
    let userDefaults = UserDefaults.standard
    
    func setThemePreferenceToDark() {
        return userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToPurple() {
        return userDefaults.set("Purple", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        if let themePreference = userDefaults.string(forKey: themePreferenceKey) {
            return themePreference
        } else {
            return nil
        }
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
}
