//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Scott Bennett on 9/13/18.
//  Copyright © 2018 Scott Bennett. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    let themePreferenceKey: String
    
    var themePreference: String? {
        return themePreferenceKey
    }
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToRed() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Red", forKey: themePreferenceKey)
    }
    
}
