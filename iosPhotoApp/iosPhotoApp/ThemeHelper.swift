//
//  ThemeHelper.swift
//  iosPhotoApp
//
//  Created by Jarren Campos on 2/20/20.
//  Copyright © 2020 Jarren Campos. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey: String = ""
    
    func setThemePreferenceToDark(){
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    func setThemePreferenceToYourColorHere() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Light", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
}
