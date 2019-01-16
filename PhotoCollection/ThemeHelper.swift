//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Stuart on 1/16/19.
//  Copyright © 2019 Stuart. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    let themePreferenceKey: String = "theme"
    
    func setThemePreferenceToDark() {
       return UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToLightBlue() {
        return UserDefaults.standard.set("Light Blue", forKey: themePreferenceKey)
    }

    var themePreference: String? {
        
        if let themePreference = UserDefaults.standard.string(forKey: themePreferenceKey) {
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
