//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Rob Vance on 4/29/20.
//  Copyright © 2020 Robs Creations. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    var themePreference: String? {
        let themePreference = UserDefaults.standard.string(forKey: .themePreferenceKey)
        return themePreference
    }
    init() {
        if themePreference == nil {
            setThemePreferenceDark()
        }
    }
    func setThemePreferenceDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: .themePreferenceKey)
    }
    func setThemePreferenceGreen() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Green", forKey: .themePreferenceKey)
    }
}
extension String {
    static var themePreferenceKey = "ThemePreferenceKey"
}
