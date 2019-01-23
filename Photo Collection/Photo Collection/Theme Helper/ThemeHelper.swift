//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Stuart on 1/23/19.
//  Copyright © 2019 Stuart. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        } else {
            setThemePreferenceToAqua()
        }
    }
    
    var themePreference: String? {
        let defaults = UserDefaults.standard
        return defaults.string(forKey: .themePreferenceKey)
    }
    
    // MARK: - Functions
    
    func setThemePreferenceToDark() {
        let defaults = UserDefaults.standard
        defaults.set("Dark", forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToAqua() {
        let defaults = UserDefaults.standard
        defaults.set("Aqua", forKey: .themePreferenceKey)
    }
}

extension String {
    static var themePreferenceKey = "UserThemePreference"
}
