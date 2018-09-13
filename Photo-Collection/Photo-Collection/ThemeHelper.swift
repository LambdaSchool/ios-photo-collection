//
//  ThemeHelper.swift
//  Photo-Collection
//
//  Created by Ilgar Ilyasov on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    // MARK: Initializer
    
    init() {
        if themePreference == nil {
            setThemePreferenceToAqua()
        } else {
            setThemePreferenceToDark()
        }
    }
    
    // MARK: - Properties
    
    let themePreferenceKey: String = ""
    
    // MARK: - Computed properties
    
    var themePreference: String? {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: themePreferenceKey)
    }
    
    // MARK: -Functions
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToAqua() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Aqua", forKey: themePreferenceKey)
    }
}
