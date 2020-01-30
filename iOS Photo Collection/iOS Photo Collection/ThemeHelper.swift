//
//  ThemeHelper.swift
//  iOS Photo Collection
//
//  Created by Nichole Davidson on 1/30/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    let themePreferenceKey: String
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYourColorHere() {
        UserDefaults.standard.set("Orange", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        UserDefaults.standard.string(forKey: themePreferenceKey)
        return themePreferenceKey
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToYourColorHere()
        } else {
           themePreference
            
        }
        init()
    }
}
