//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Christopher Aronson on 5/2/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    let themePreferenceKey = "themePreferenceKey"
    var themePreference: String? {
        
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    init() {
        
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    func setThemePreferenceToDark() {
        
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        
        let userDefaults = UserDefaults.standard
        userDefaults.set("Blue", forKey: themePreferenceKey)
    }
}
