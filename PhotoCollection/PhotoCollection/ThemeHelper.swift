//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Enrique Gongora on 1/30/20.
//  Copyright © 2020 Enrique Gongora. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    let themePreferenceKey: String = "themePreferenceKey"
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYourColorHere() {
        UserDefaults.standard.set("Blue", forKey: themePreferenceKey)
    }
    
    var themePreference: String?{
        let themePreference = UserDefaults.standard.string(forKey: themePreferenceKey)
        return themePreference
    }
    
}
