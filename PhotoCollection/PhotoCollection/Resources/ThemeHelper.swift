//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Elizabeth Thomas on 2/19/20.
//  Copyright © 2020 Libby Thomas. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    private let themePreferenceKey = "themePreference"
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToGreen() {
        UserDefaults.standard.set("Green", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    
    init() {
        guard themePreference == nil else { return }
        setThemePreferenceToDark()
    
    }
}
