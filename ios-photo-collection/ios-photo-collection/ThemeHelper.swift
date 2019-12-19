//
//  ThemeHelper.swift
//  ios-photo-collection
//
//  Created by user162867 on 12/19/19.
//  Copyright © 2019 user162867. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey: String = "ThemePreference"
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    init () {
        if themePreference == nil {
            setThemePreferenceToWhite()
        }
    }
    
    struct keys {
        static let dark = "Dark"
        static let blue = "Blue"
        static let white = "White"
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set(keys.dark, forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        UserDefaults.standard.set(keys.blue, forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToWhite() {
        UserDefaults.standard.set(keys.white, forKey: themePreferenceKey)
    }
    
    
}
