//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Mitchell Budge on 5/9/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import Foundation

extension String {
    static var themePreferenceKey = "themePreferenceKey"
}

class ThemeHelper {
    init() {
        if themePreference == "" {
            setThemePreferenceToDark()
        }
    }
    
    var themePreference: String {
        let userDefaults = UserDefaults.standard
        guard let theme = userDefaults.string(forKey: .themePreferenceKey) else { return "" }
        return theme
    }
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: .themePreferenceKey)
    } // end of set theme to dark function
    
    
    func setThemePreferenceToGray() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Gray", forKey: .themePreferenceKey)
    } // end of set theme to gray function
}
