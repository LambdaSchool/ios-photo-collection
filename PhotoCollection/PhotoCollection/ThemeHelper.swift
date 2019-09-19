//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by admin on 9/19/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    let themePreferenceKey = "ThemePreference"
    
    let userDefaults = UserDefaults.standard
    
    var themePreference: String? {
        return userDefaults.string(forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.setValue("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYourColorHere() {
        UserDefaults.standard.setValue("Blue", forKey: themePreferenceKey)
    }
    
}
