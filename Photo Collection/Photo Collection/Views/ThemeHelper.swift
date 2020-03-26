//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Cody Morley on 3/26/20.
//  Copyright © 2020 Cody Morley. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    let themePreferenceKey = "ThemePreferenceKey"
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        UserDefaults.standard.set("Blue", forKey: themePreferenceKey)
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
}


