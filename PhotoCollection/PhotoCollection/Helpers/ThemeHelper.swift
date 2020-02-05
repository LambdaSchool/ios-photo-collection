//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Vijay Das on 1/24/19.
//  Copyright © 2019 Vijay Das. All rights reserved.
//

import UIKit

class ThemeHelper {
    
    let themePreferenceKey: String = ""
    
    let userDefaults = UserDefaults.standard
    
    func setThemePreferenceToDark() {
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToLight() {
        userDefaults.set("Light", forKey: themePreferenceKey)
    }

    var themePreference: String? {
        let themePreference = userDefaults.string(forKey: themePreferenceKey)
        return themePreference
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
}
