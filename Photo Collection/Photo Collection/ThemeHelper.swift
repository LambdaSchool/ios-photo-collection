//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Moses Robinson on 1/16/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

import UIKit

class ThemeHelper {
    
    let themePreferenceKey: String = ""
    
    var themePreference: String? {
        let userDefaults = UserDefaults.standard
        let themePreference = userDefaults.string(forKey: themePreferenceKey)
        return themePreference
    }
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToPurple() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Purple", forKey: themePreferenceKey)
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
}
