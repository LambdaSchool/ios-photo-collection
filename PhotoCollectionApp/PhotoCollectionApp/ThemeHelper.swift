//
//  ThemeHelper.swift
//  PhotoCollectionApp
//
//  Created by Nelson Gonzalez on 1/16/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation
class ThemeHelper {
    let themePreferenceKey = "themePreferenceKey"
    
   init() {
        if themePreference == nil {
            setThemePreferenceToLight()
        }
    }
    
    
    var themePreference: String? {
       
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    func setThemePreferenceToLight() {
        UserDefaults.standard.set("Light", forKey: themePreferenceKey)
    }
}
