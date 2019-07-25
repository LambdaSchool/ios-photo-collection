//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by admin on 7/25/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey = "ThemePreference"
    
    let userDefaults = UserDefaults.standard
    
    var themePreference: String? {
       return userDefaults.string(forKey: themePreferenceKey)
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.setValue("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYourColorHere() {
        UserDefaults.standard.setValue("Blue", forKey: themePreferenceKey)
    }
    
    
}
