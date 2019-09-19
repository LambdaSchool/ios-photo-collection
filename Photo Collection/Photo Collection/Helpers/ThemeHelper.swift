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
    
    func setThemePreferenceToMaroon() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Maroon", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        let darkPreference = UserDefaults.standard.string(forKey: "Dark")
        return darkPreference
        let maroonPreference = UserDefaults.standard.string(forKey: "Maroon")
        return maroonPreference
    }
}
