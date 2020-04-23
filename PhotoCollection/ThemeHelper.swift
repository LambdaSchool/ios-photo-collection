//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Nonye on 4/23/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

import Foundation


class ThemeHelper {
    let themePreferenceKey = "ThemePreferenceKey"
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYourRed() {
        UserDefaults.standard.set("Red", forKey: themePreferenceKey)
        
    }
    init() {
       if themePreference == nil {
            setThemePreferenceToYourRed()
        }
    }
}
