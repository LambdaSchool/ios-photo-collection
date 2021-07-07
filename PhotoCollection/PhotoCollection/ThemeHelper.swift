//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Ryan Murphy on 5/9/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey = "themePreferenceKey"
    
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
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
        
        
        
    }
    
    
}
