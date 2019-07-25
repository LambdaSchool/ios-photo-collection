//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Alex Rhodes on 7/25/19.
//  Copyright © 2019 Blake Andrew Price. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    let themePreferenceKey: String
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYouColorHue() {
        UserDefaults.standard.set("Light", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    init(themePreferenceKey: String) {
        self.themePreferenceKey = themePreferenceKey
        
        if themePreferenceKey == "" {
            setThemePreferenceToDark()
        }
    }
    
}
