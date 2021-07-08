//
//  ThemeHelper.swift
//  MBP-iOS4-PhotoCollection-Dillon-Walkthrough
//
//  Created by Vijay Das on 12/6/18.
//  Copyright © 2018 Vijay Das. All rights reserved.
//

import Foundation

class ThemeHelper {
    static let shared = ThemeHelper()
    
    let themePreferenceKey = "ThemePreferenceKey"
    
    private init () {
    
        if UserDefaults.standard.string(forKey: themePreferenceKey) == nil {
            UserDefaults.standard.set("Light", forKey: themePreferenceKey)
            
        }
    }
    
    
    var themePreference: String {
        return UserDefaults.standard.string(forKey: themePreferenceKey) ?? "Light"
    }
    
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
        
    }
    
    func setThemePreferenceToLight() {
        UserDefaults.standard.set("Light", forKey: themePreferenceKey)
        
    }
    
    
}
