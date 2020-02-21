//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Rob Vance on 2/20/20.
//  Copyright © 2020 Rob Vance. All rights reserved.
//

import Foundation


class ThemeHelper {
    var themePreference: String? {
        let themePreference = UserDefaults.standard.string(forKey: .themePreferenceKey)
        return themePreference
    }
    
    
    func setThemePreferenceDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: .themePreferenceKey)
    }
    func setThemePreferenceGreen() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Green", forKey: .themePreferenceKey)
    }
}
extension String { 
    static var themePreferenceKey = "ThemePreferenceKey"
}
