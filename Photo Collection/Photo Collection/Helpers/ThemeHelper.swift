//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by morse on 10/17/19.
//  Copyright © 2019 morse. All rights reserved.
//

import Foundation
class ThemeHelper {
    
    init() {
        if themePreference == nil {
            setThemePreferenceToPurple()
        }
    }
    
    struct PropertyKeys {
        static let themeKey = ""
        static let dark = "Dark"
        static let purple = "Purple"
    }
    
    let themePreferenceKey = PropertyKeys.themeKey
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: PropertyKeys.purple)
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set(PropertyKeys.dark, forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToPurple() {
        UserDefaults.standard.set(PropertyKeys.purple, forKey: themePreferenceKey)
    }
}
