//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Lambda_School_Loaner_259 on 2/27/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import Foundation

class ThemeHelper {
    // MARK: - Properties
    var themePreference: String? {
        if UserDefaults.standard.string(forKey: .themePreferenceKey) == .dark {
            return .dark
        } else {
            return .light
        }
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToLight()
        }
    }
    
    // MARK: - Methods
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set(String.dark, forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToLight() {
        UserDefaults.standard.set(String.light, forKey: .themePreferenceKey)
    }
    
    
}
