//
//  ThemeHelp.swift
//  ios photo Collection
//
//  Created by Nicolas Rios on 8/16/19.
//  Copyright © 2019 Nicolas Rios. All rights reserved.
//

import Foundation


class ThemeHelper {
    
    
    init() {
        if themePreference == nil {
            setThemePreferenceToLight()
        }
    }
    
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: "Dark")
    }
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: String.themePreferenceKey)
    }
    
    func setThemePreferenceToLight() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Light", forKey: String.themePreferenceKey)
    }
    
}

extension String {
    static var themePreferenceKey = "themePreferenceKey"
}
