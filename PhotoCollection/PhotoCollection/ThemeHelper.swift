//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Jocelyn Stuart on 1/16/19.
//  Copyright © 2019 JS. All rights reserved.
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


