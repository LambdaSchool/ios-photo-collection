//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Jordan Christensen on 8/23/19.
//  Copyright © 2019 Mazjap Co Technologies. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey = "ThemePreference"
    let userDefaults = UserDefaults.standard
    
    var themePreference: String? = {
        let themePreferenceKey = "ThemePreference"
        let userDefaults = UserDefaults.standard
        guard let pref: String = userDefaults.string(forKey: themePreferenceKey) else { return nil }
        return pref
    }()
    
    func setThemePreferenceToDark() {
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        userDefaults.set("Blue", forKey: themePreferenceKey)
    }
}
