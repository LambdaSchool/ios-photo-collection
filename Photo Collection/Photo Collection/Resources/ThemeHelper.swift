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
    
    let PreferenceKeys = (
        theme: "ThemePreference",
        darkTheme: "Dark",
        blueTheme: "Blue"
    )
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: PreferenceKeys.theme)
    }
    
    // MARK: - Methods
    
    init() {
        if themePreference == nil {
            setThemePreferenceToBlue()
        }
    }
    
    func setThemePreferenceToBlue() {
        UserDefaults.standard.set(PreferenceKeys.blueTheme, forKey: PreferenceKeys.theme)
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set(PreferenceKeys.darkTheme, forKey: PreferenceKeys.theme)
    }
}
