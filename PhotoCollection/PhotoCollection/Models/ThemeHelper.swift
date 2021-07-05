//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Dennis Rudolph on 10/17/19.
//  Copyright © 2019 LambdaSchool. All rights reserved.
//

import Foundation

class ThemeHelper {
   
    let themePreferenceKey: String = ""
    
    var themePreference: String? {
        let value = UserDefaults.standard.string(forKey: themePreferenceKey)

        return value
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        UserDefaults.standard.set("Blue", forKey: themePreferenceKey)
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
}
