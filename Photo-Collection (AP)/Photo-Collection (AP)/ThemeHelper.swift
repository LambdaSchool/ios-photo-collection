//
//  ThemeHelper.swift
//  Photo-Collection (AP)
//
//  Created by Samuel Esserman on 2/27/20.
//  Copyright © 2020 Samuel Esserman. All rights reserved.
//
//MARK: - Part 2: Create Class

import Foundation
// Part 2: #2 can't be completed until you complete step four

class ThemeHelper {
    let themePreferenceKey: String = "themePreferenceKey"
    var themePreference: String? {
        UserDefaults.standard.string(forKey: themePreferenceKey)
    }

//MARK: - Functions
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToLight() {
        UserDefaults.standard.set("Light", forKey: themePreferenceKey)
    }

//MARK: - Initialized
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
}
