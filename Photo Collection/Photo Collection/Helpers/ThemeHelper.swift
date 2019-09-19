//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Jesse Ruiz on 9/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey: String
    
    init(themePreferenceKey: String) {
        self.themePreferenceKey = themePreferenceKey
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
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
        let magentaPreference = UserDefaults.standard.string(forKey: "Magenta")
        return magentaPreference
    }
}
