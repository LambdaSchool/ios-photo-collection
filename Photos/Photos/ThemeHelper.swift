//
//  ThemeHelper.swift
//  Photos
//
//  Created by Victor  on 5/2/19.
//  Copyright © 2019 com.Victor. All rights reserved.
//

import Foundation

class ThemeHelper {
    //safety string
    let themePreferenceKey: String = "themePreferenceKey"
    
    //setting theme to light
    init() {
        if themePreference == nil {
            let userDefaults = UserDefaults.standard
            userDefaults.set("Light", forKey: themePreferenceKey)
        }
    }
    
    //sets dark key
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    //sets light key
    func setThemePreferenceToYourColorHere() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Light", forKey: themePreferenceKey)
    }
    
    //returns preference 
    var themePreference: String? {
        let shouldShowColor = UserDefaults.standard.string(forKey: themePreferenceKey)
        return shouldShowColor
    }
    
}
