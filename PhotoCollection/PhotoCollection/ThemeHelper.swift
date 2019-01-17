//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Stuart on 1/16/19.
//  Copyright © 2019 Stuart. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    init() {
        if themePreference == nil {
            setThemePreferenceToCyan()
        } else {
            setThemePreferenceToDark()
        }
    }
    
    var themePreference: String? {
        let defaults = UserDefaults.standard
        return defaults.string(forKey: .themePreferenceKey)
    }
    
    // MARK: -Functions
    
    func setThemePreferenceToDark() {
        let defaults = UserDefaults.standard
        defaults.set("Dark", forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToCyan() {
        let defaults = UserDefaults.standard
        defaults.set("Cyan", forKey: .themePreferenceKey)
    }
}

extension String {
    static var themePreferenceKey = "UserThemePreference"
}

