//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Nathanael Youngren on 1/16/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey: String
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYellow() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Yellow", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        guard let result = UserDefaults.standard.string(forKey: themePreferenceKey) else { return nil }
        return result
    }
    
    init(themePreferenceKey: String) {
        self.themePreferenceKey = themePreferenceKey
        
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
}
