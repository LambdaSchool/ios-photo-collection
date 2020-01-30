//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Chad Rutherford on 11/14/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Properties
    let defaults = UserDefaults.standard
    
    var themePreference: String? {
        return defaults.string(forKey: UserDefaultKeys.themePreferenceKey)
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Initialization
    init() {
        guard let _ = themePreference else { setThemePreferenceToLight(); return }
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Helper Methods
    /// Function to set the users preference to "Dark" mode
    func setThemePreferenceToDark() {
        defaults.set("Dark", forKey: UserDefaultKeys.themePreferenceKey)
    }
    
    /// Function to set the users preference to "Light" mode
    func setThemePreferenceToLight() {
        defaults.set("Light", forKey: UserDefaultKeys.themePreferenceKey)
    }
}
