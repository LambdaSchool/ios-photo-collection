//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Alex Rhodes on 7/25/19.
//  Copyright © 2019 Blake Andrew Price. All rights reserved.
//

import Foundation

class ThemeHelper {

    let themePreferenceKey = "themePreferenceKey"
    
    var themePreference: String? {
        let userDefaults = UserDefaults.standard
        let chosenTheme = userDefaults.string(forKey: themePreferenceKey)
        return chosenTheme
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYouColorHue() {
        UserDefaults.standard.set("Light", forKey: themePreferenceKey)
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
}
