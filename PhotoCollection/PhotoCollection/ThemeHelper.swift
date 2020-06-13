//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Cora Jacobson on 6/10/20.
//  Copyright © 2020 Cora Jacobson. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey = "themePreference"
    
    func setThemePreferenceToDark() {
        let themePreference = "Dark"
        UserDefaults.standard.set(themePreference, forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToPurple() {
        let themePreference = "Purple"
        UserDefaults.standard.set(themePreference, forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        if let theme = UserDefaults.standard.string(forKey: themePreferenceKey) {
            return theme
        } else {
            return nil
        }
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToPurple()
        }
    }
    
}
