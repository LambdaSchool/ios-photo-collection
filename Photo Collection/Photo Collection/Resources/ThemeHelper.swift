//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Jon Bash on 2019-10-17.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    // MARK: - Properties
    
    let themePreferenceKey = "ThemePreference"
    
    var themePreference: ThemePreference? {
        guard let themePrefRawValue = UserDefaults.standard.string(forKey: themePreferenceKey)
            else { return nil }
        return ThemePreference.init(rawValue: themePrefRawValue)
    }
    
    // MARK: - Methods
    
    init() {
        if themePreference == nil {
            setThemePreferenceToBlue()
        }
    }
    
    func setThemePreferenceToBlue() {
        UserDefaults.standard.set(ThemePreference.blue.rawValue, forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set(ThemePreference.dark.rawValue, forKey: themePreferenceKey)
    }
}

enum ThemePreference: String {
    case blue = "Blue"
    case dark = "Dark"
}
