//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Wyatt Harrell on 2/27/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import Foundation


class ThemeHelper {
    let themePreferenceKey: String = ""
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToLight() {
        UserDefaults.standard.set("Light", forKey: themePreferenceKey)
    }
    
    init() {
        if UserDefaults.standard.string(forKey: themePreferenceKey) == nil {
            setThemePreferenceToLight()
        }
    }
    
}
