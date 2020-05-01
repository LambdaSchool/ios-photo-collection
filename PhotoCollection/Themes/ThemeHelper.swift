//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Josh Kocsis on 4/30/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    let themePreferenceKey: String
    
    init(themePreferenceKey: String) {
        self.themePreferenceKey = themePreferenceKey
        if themePreference == nil {
            setThemePreferenceDark()
        }
    }
    

    func setThemePreferenceDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToRed() {
        UserDefaults.standard.set("Red", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        let darkTheme = UserDefaults.standard.string(forKey: "Dark")
        return darkTheme
        let redTheme = UserDefaults.standard.string(forKey: "Red")
        return redTheme
    }
}
