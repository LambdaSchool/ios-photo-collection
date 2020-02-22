//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Chris Price on 12/12/19.
//  Copyright © 2019 Chris Price. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey = "ThemePreference"
    
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
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
}
