//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Shawn Gee on 2/27/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import Foundation

private let themePreferenceKey = "themePreferenceKey"

class ThemeHelper {
    
    // Themes
    static let darkTheme = "Dark"
    static let indigoTheme = "Indigo"
    
    var themePreference: String {
        return UserDefaults.standard.string(forKey: themePreferenceKey) ?? ThemeHelper.darkTheme
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set(ThemeHelper.darkTheme, forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToIndigo() {
        UserDefaults.standard.set(ThemeHelper.indigoTheme, forKey: themePreferenceKey)
    }
}
