//
//  ThemeHelper.swift
//  PhotoCollection2
//
//  Created by brian vilchez on 8/22/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import Foundation

extension String {
    static let themePreferenceKey = "themePreferenceKey"
    
}


class ThemeHelper {
    
    var themePreference: String? {
        
        let selectedTheme = UserDefaults.standard.string(forKey: .themePreferenceKey)
        if selectedTheme == "Dark" {
            setThemePreferenceToDark()
        } else if selectedTheme == "blue" {
            setThemePreferenceToAnotherColor()
        }
        return selectedTheme
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToAnotherColor() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("blue", forKey: .themePreferenceKey)
    }
}
