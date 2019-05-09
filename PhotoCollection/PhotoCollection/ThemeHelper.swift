//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Thomas Cacciatore on 5/9/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey: String = ""
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
    
    func setThemePreferenceToOrange() {
        UserDefaults.standard.set("Orange", forKey: themePreferenceKey)
    }
    
    
}
