//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Sameera Leola on 12/6/18.
//  Copyright © 2018 Sameera Leola. All rights reserved.
//

import Foundation

class ThemeHelper {
    static let shared = ThemeHelper()
    private init () {
        if UserDefaults.standard.string(forKey: themePreferenceKey) == nil {
            UserDefaults.standard.set("Light", forKey: themePreferenceKey)
        }
    }
    
    let themePreferenceKey = "ThemePreferenceKey"
    
    //If the preference isn't set default to Light
    var themePreference: String {
        return UserDefaults.standard.string(forKey: themePreferenceKey)  ?? "Light"
    }
    
    func setThemePreferenceToDark() {
        //Returns the user defaults
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToLight() {
        UserDefaults.standard.set("Light", forKey: themePreferenceKey)
    }
}
