//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Richard Gibbs on 5/21/20.
//  Copyright © 2020 Rich Gibbs. All rights reserved.
//

import Foundation


class ThemeHelper {
    var themePreferenceKey: String = "themePreferenceKey"
    var themePreference: String?
    
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    func string(forKey themePreferenceKey: String) -> String? {
        return themePreferenceKey
    }
    
    
    func setThemePreferenceToDark() {
        let defaults = UserDefaults.standard
        defaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYourColorHere() {
        let defaults = UserDefaults.standard
        defaults.set("Red", forKey: themePreferenceKey)
    }
}


