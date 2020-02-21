//
//  ThemeHelper.swift
//  Photos
//
//  Created by Breena Greek on 2/19/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import Foundation

class ThemeHelper {
    private let themePreferenceKey: String = "themePreferenceKey"
    
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
            guard themePreferenceKey == nil else { return }
                setThemePreferenceToPurple()
        }
    }

