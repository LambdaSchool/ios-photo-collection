//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Scott Bennett on 9/13/18.
//  Copyright © 2018 Scott Bennett. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    let themePreferenceKey = ""
    
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
