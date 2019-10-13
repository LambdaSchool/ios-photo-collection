//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Alex Thompson on 10/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

extension String {
    static var themePreferenceKey = "ThemePreference"
}

class ThemeHelper {
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    var themePreference: String? {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToRed() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Red", forKey: .themePreferenceKey)
    }
}
