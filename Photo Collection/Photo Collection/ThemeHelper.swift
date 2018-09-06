//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Moin Uddin on 9/6/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    init() {
        if themPreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    let themePreferenceKey: String = "themePreferenceKey"
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        UserDefaults.standard.set("Blue", forKey: themePreferenceKey)
    }
    
    var themPreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
}
