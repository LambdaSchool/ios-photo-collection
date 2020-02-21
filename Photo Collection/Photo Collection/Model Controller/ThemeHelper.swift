//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Juan M Mariscal on 2/20/20.
//  Copyright © 2020 Juan M Mariscal. All rights reserved.
//

import Foundation

class ThemeHelper {

    // computed property
    var themePreference: String? {
        let themePreference = UserDefaults.standard.string(forKey: .themePreferenceKey)
        return themePreference
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToYourColorHere() {
        UserDefaults.standard.set("Blue", forKey: .themePreferenceKey)
    }
    
    
}
