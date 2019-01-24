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
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        let themePreference = userDefaults.string(forKey: themePreferenceKey)
        return themePreference
    }
    
    
    
    
    
}
