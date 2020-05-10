//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Joel Groomer on 8/15/19.
//  Copyright © 2019 Julltron. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey = "themePreference"
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        UserDefaults.standard.set("Blue", forKey: themePreferenceKey)
    }
}
