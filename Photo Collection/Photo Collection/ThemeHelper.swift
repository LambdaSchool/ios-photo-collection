//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Daniela Parra on 9/6/18.
//  Copyright © 2018 Daniela Parra. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey = "ThemePreferenceKey"
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYellow() {
        UserDefaults.standard.set("Yellow", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
}
