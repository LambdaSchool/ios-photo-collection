//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Gi Pyo Kim on 9/19/19.
//  Copyright © 2019 GIPGIP Studio. All rights reserved.
//

import Foundation

class ThemeHelper {
    // MARK: - Properties
    let themePreferenceKey: String = ""
    var hueValue = 0
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    // MARK: - Initializer
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
        hueValue = Int.random(in: 0...359)
    }
    
    // MARK: - Methods
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToRandom() {
        UserDefaults.standard.set("Random", forKey: themePreferenceKey)
    }
    
}
