//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Chad Parker on 2/20/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

import Foundation

class ThemeHelper {

    let themePreferenceKey = "themePreferenceKey"

    var themePreference: String? {
        UserDefaults.standard.string(forKey: themePreferenceKey)
    }

    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }

    func setThemePreferenceToBlue() {
        UserDefaults.standard.set("Blue", forKey: themePreferenceKey)
    }

    init() {
        if themePreference == nil {
            setThemePreferenceToBlue()
        }
    }
}
