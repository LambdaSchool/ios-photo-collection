//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Vincent Hoang on 4/23/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey: String = "PhotoCollectionTheme"
    
    var themePreference: String? {
        let lastSelectedTheme = UserDefaults.standard.string(forKey: themePreferenceKey) ?? "light"
        
        return lastSelectedTheme
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToLight()
        }
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.setValue("dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToLight() {
        UserDefaults.standard.setValue("light", forKey: themePreferenceKey)
    }
}
