//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Claudia Contreras on 2/20/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey: String = ""
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        UserDefaults.standard.set("Blue", forKey: themePreferenceKey)
    }
}
