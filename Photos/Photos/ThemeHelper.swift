//
//  ThemeHelper.swift
//  Photos
//
//  Created by Victor  on 5/2/19.
//  Copyright © 2019 com.Victor. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    let themePreferenceKey: String = "themePreferenceKey"
    
    init() {
        
        if themePreference == nil {
            let userDefaults = UserDefaults.standard
            userDefaults.set("Blue", forKey: themePreferenceKey)
        }
    }
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYourColorHere() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Blue", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        let shouldShowColor = UserDefaults.standard.string(forKey: themePreferenceKey)
        return shouldShowColor
        
    }
    
}
