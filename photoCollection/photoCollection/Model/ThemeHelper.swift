//
//  ThemeHelper.swift
//  photoCollection
//
//  Created by Sammy Alvarado on 4/30/20.
//  Copyright © 2020 Sammy Alvarado. All rights reserved.
//

import Foundation

class ThemeHelper {

    /*
     In the initializer for this class (you will have to call it), check if the themePreference value is nil. If it is, then call one of the setThemePreference functions you just created. This will make it so the first time the user opens the app a preference will be set for them until they choose to change it.
     */
    
    let themePreferenceKey = "ThemePreference"
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYourColorHere() {
           let userDefaults = UserDefaults.standard
           userDefaults.set("Blue", forKey: themePreferenceKey)
       }
    
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    
}
