//
//  ThemeHelper.swift
//  photo collect
//
//  Created by ronald huston jr on 4/23/20.
//  Copyright © 2020 HenryQuante. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    let themePreferenceKey: String = "themePrefer"
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToSlate() {
        UserDefaults.standard.set("Slate", forKey: themePreferenceKey)
    }
    init() {
        if UserDefaults.standard.string(forKey: themePreferenceKey) == nil {
            setThemePreferenceToDark()
        }
    }
}
