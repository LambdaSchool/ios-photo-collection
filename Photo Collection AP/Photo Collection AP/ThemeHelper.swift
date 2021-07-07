//
//  ThemeHelper.swift
//  Photo Collection AP
//
//  Created by Jorge Alvarez on 12/19/19.
//  Copyright © 2019 Jorge Alvarez. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    var themePreferenceKey: String = "preference"// use to save user's theme preference or get it from UD
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYourColorHere() {
        UserDefaults.standard.set("Blue", forKey: themePreferenceKey) //?
    }
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
}
