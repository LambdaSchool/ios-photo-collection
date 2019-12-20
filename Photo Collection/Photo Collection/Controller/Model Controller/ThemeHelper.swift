//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Kenny on 12/19/19.
//  Copyright © 2019 Hazy Studios. All rights reserved.
//

import Foundation


class ThemeHelper {
    private let userDefaults = UserDefaults.standard
    
    var themePreference: String? {
        return userDefaults.string(forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToDark() {
        userDefaults.set("Dark", forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToLight() {
        userDefaults.set("Light", forKey: .themePreferenceKey)
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToLight()
        }
    }

    
}

extension String {
    static let themePreferenceKey = "themePreference"
}
