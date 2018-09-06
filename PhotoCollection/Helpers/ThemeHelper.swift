//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Farhan on 9/6/18.
//  Copyright © 2018 Farhan. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    let themePreferenceKey: String = "themePreferenceKey"
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    var themePreference: String? {
        
        return UserDefaults.standard.string(forKey: themePreferenceKey)
        
    }
    
    func setThemePreferenceToDark() {
        
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
        
        
    }
    
    func setThemePreferenceToYourColorHere() {
        
        UserDefaults.standard.set("Red", forKey: themePreferenceKey)
        
    }
}
