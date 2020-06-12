//
//  ThemHelper.swift
//  Photo Collection
//
//  Created by Gladymir Philippe on 6/11/20.
//  Copyright © 2020 Gladymir Philippe. All rights reserved.
//

import Foundation

class ThemeHelper {

    // MARK: - Properties
    let themePreferenceKey: String

    init(themePreferenceKey: String) {
        self.themePreferenceKey = themePreferenceKey
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }

    // MARK: - Methods
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }

    func setThemePreferenceToMagenta() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Magenta", forKey: themePreferenceKey)
    }

    var themePreference: String? {
        let darkPreference = UserDefaults.standard.string(forKey: "Dark")
        return darkPreference
        let magentaPreference = UserDefaults.standard.string(forKey: "Green")
        return magentaPreference
    }
}
