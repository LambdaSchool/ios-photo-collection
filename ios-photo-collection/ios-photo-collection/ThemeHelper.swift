//
//  ThemeHelper.swift
//  ios-photo-collection
//
//  Created by Matthew Martindale on 2/19/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    private let themePreferenceKey = "themePreference"
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToGold() {
        UserDefaults.standard.set("Gold", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    

    init() {
        guard themePreference == nil else { return }
        setThemePreferenceToGold()
    }
    
}
