//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Donella Barcelo on 11/14/19.
//  Copyright © 2019 Donella Barcelo. All rights reserved.
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
