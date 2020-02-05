//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by morse on 10/17/19.
//  Copyright © 2019 morse. All rights reserved.
//

import Foundation
class ThemeHelper {
    
    init() {
        if themePreference == nil {
            setThemePreferenceToPurple()
        }
    }
    
    struct PropertyKeys {
        static let dark = "Dark"
        static let purple = "Purple"
    }
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: .themeKey)
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set(PropertyKeys.dark, forKey: .themeKey)
    }
    
    func setThemePreferenceToPurple() {
        UserDefaults.standard.set(PropertyKeys.purple, forKey: .themeKey)
    }
}
