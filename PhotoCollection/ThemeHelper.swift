//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Osha Washington on 12/12/19.
//  Copyright © 2019 Osha Washington. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    var themePreferenceKey: String? {
        return UserDefaults.standard.string(forKey: .themePreference)
    }
    
    init() {
        if themePreferenceKey == nil {
            setThemePreferenceToYourColorHere()
        }
    }
    struct PropertyKeys {
        static let dark = "Dark"
        static let blue = "Blue"
    }

    func setThemePreferenceToDark() {
        UserDefaults.standard.set(PropertyKeys.dark, forKey: .themePreference)
    }

    func setThemePreferenceToYourColorHere() {
        UserDefaults.standard.set(PropertyKeys.blue, forKey: .themePreference)
    }
}


extension String {
    static var themePreference = "themePreference"
}
