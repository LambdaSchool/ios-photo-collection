//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Jonathan Ferrer on 5/9/19.
//  Copyright © 2019 Jonathan Ferrer. All rights reserved.
//

import Foundation

class ThemeHelper {

    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }

    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }

    func setThemePreferenceToGreen() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Green", forKey: themePreferenceKey)
    }

    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }

    let themePreferenceKey = "themePreferenceKey"
}
