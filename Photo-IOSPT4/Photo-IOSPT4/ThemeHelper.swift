//
//  ThemeHelper.swift
//  Photo-IOSPT4
//
//  Created by David Williams on 12/11/19.
//  Copyright © 2019 david williams. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey: String
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    func setThemePreferenceToYourColorHere() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Green", forKey: themePreferenceKey)
    }
    
    var themePreference = UserDefaults.standard.bool(forKey: themePreferenceKey)
}
