//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Vijay Das on 1/24/19.
//  Copyright © 2019 Vijay Das. All rights reserved.
//

import UIKit

class ThemeHelper {
    
    let themePreferenceKey: String = ""
    
    let userDefaults = UserDefaults.standard
    
    func setThemePreferenceToDark() {
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToLight() {
        userDefaults.set("Light", forKey: themePreferenceKey)
    }
    
}
