//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Harmony Radley on 3/26/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

import Foundation





class ThemeHelper {

    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToPurple() {
        UserDefaults.standard.set("Purple", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    init() {
        guard themePreference == nil else { return }
        setThemePreferenceToDark()
        
    }
     private let themePreferenceKey = "themePreference"
}
