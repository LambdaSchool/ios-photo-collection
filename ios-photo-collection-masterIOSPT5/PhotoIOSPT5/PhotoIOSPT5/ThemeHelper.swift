//
//  ThemeHelper.swift
//  PhotoIOSPT5
//
//  Created by David Williams on 2/19/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    let themePreferenceKey: String
    
    init(themePreferenceKey: String){
        self.themePreferenceKey = themePreferenceKey
    }
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYourColorHere() {
        let userDefaults = UserDefaults.standard
        UserDefaults.standard.set("Green", forKey: themePreferenceKey)
    }
    
    var themePreference: String {
        let userDefaults = UserDefaults.standard
        let theme = userDefaults.string(forKey: themePreferenceKey)
        guard let themeKey = theme else { return "" }
        return themeKey
    }
}
