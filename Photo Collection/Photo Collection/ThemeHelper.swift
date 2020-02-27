//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Mark Gerrior on 2/27/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

import Foundation

extension String {
    static let themePreferenceKey = "themePreference"
}

class ThemeHelper {
    var themePreference: String? {
        get {
            return UserDefaults.standard.string(forKey: .themePreferenceKey)
        }
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    func setThemePreferenceToDark() {
        setThemePreferenceTo("Dark")
    }
    
    func setThemePreferenceToBlue() {
        setThemePreferenceTo("Blue")
    }
    
    private func setThemePreferenceTo(_ color: String) {
        UserDefaults.standard.set(color, forKey: .themePreferenceKey)
    }
}
