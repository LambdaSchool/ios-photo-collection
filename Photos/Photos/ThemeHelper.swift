//
//  ThemeHelper.swift
//  Photos
//
//  Created by scott harris on 1/30/20.
//  Copyright © 2020 scott harris. All rights reserved.
//

import Foundation


class ThemeHelper {
    let themePreferenceKey: String = "themePreferenceKey"
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
        
    }
    
    func setThemePreferenceToLight() {
        UserDefaults.standard.set("Light", forKey: themePreferenceKey)
        
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
}
