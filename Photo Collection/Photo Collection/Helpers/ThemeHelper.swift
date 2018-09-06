//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Dillon McElhinney on 9/6/18.
//  Copyright © 2018 Dillon McElhinney. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    // MARK: - Properties
    let themePreferenceKey = "ThemePreference"
    
    // MARK: - Initializers
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    // MARK: - Utility Functions
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToLight() {
        UserDefaults.standard.set("Light", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
}
