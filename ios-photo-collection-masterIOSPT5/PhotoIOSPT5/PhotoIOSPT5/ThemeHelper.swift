//
//  ThemeHelper.swift
//  PhotoIOSPT5
//
//  Created by David Williams on 2/19/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    var themePreferenceKey: String
    init(themePreferenceKey: String){
        self.themePreferenceKey = themePreferenceKey
    }
    
    
    func setThemePreferenceToDark() {
        themePreferenceKey = .themePreferenceDark
        UserDefaults.standard.set(true, forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYourColorHere() {
        themePreferenceKey = .themePreferenceGreen
        UserDefaults.standard.set(true, forKey: themePreferenceKey)
    }
    
    var themePreference: String {
        let userDefaults = UserDefaults.standard
        let theme = userDefaults.string(forKey: themePreferenceKey)
        guard let themeKey = theme else { return "" }
        return themeKey
    }
}
