//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Shawn James on 2/27/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

import Foundation

private let themePreferenceKey = "themePreferenceKey"

class ThemeHelper {
    // MARK: - Properties
    static let redTheme = "Red"
    static let blueTheme = "Blue"
    // this will be used whenever you need to save the user's theme preference or get it from UserDefaults
    var themePreference: String {
        UserDefaults.standard.string(forKey: themePreferenceKey) ?? ThemeHelper.redTheme
    }
    
    // MARK: - Methods
    func setThemePreferenceToRed() {
        UserDefaults.standard.set(ThemeHelper.redTheme, forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        UserDefaults.standard.set(ThemeHelper.blueTheme, forKey: themePreferenceKey)
    }
}
