//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Uptiie on 8/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey = "themePreferenceKey"
    
    //computed property
    var themePreference: String? {
         return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToLight() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Light", forKey: themePreferenceKey)
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
}


