//
//  ThemeHelper.swift
//  iOS-Photo-Collection
//
//  Created by Vijay Das on 1/16/19.
//  Copyright © 2019 Vijay Das. All rights reserved.
//

import Foundation
import UIKit

class ThemeHelper {
    
    let themePreferenceKey = "ThemePreferenceKey"
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
     }
    
    func setThemePreferenceToLight() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Light", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: themePreferenceKey)
    }
    
    init () {
        let userDefaults = UserDefaults.standard
        if userDefaults.string(forKey: themePreferenceKey) == nil {
            userDefaults.set("Light", forKey: themePreferenceKey)
        }
    }
    
}
