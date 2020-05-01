//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Bohdan Tkachenko on 4/30/20.
//  Copyright © 2020 Bohdan Tkachenko. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey: String = "themePreference"
    
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    func setThemePreferenceDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
        
        }
    
    func setThemePreferenceToRed() {
        UserDefaults.standard.set("Red", forKey: themePreferenceKey)
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToRed()
        }
    }
    
}

