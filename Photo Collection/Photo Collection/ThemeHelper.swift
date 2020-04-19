//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Isaac Lyons on 9/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

extension String {
    static var themePreferenceKey = "ThemePreference"
}

class ThemeHelper {
    
    init() {
        if themePerference == nil {
            setThemePreferenceToOrange()
        }
    }
    
    var themePerference: String? {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToOrange() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Orange", forKey: .themePreferenceKey)
    }
}
