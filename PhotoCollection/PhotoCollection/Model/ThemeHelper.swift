//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Joshua Rutkowski on 12/12/19.
//  Copyright © 2019 Joshua Rutkowski. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    var themePreferenceKey: String? {
        return UserDefaults.standard.string(forKey: .themePreference)
    }
    
    init() {
        if themePreferenceKey == nil {
            setThemePreferenceToWhite()
        }
    }
    
    struct PropertyKeys {
        static let dark = "Dark"
        static let blue = "Blue"
        static let white = "White"
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set(PropertyKeys.dark, forKey: .themePreference)
    }
    
    func setThemePreferenceToBlue() {
        UserDefaults.standard.set(PropertyKeys.blue, forKey: .themePreference)
    }
    
    func setThemePreferenceToWhite() {
        UserDefaults.standard.set(PropertyKeys.white, forKey: .themePreference)
    }
}

extension String {
    static var themePreference = "themePreference"
}
