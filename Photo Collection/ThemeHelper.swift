//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by William Chen on 8/22/19.
//  Copyright © 2019 William Chen. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey: String
    //this will be used whenever you need to save the user's theme preference or get it from UserDefaults
    
    var themePreference: String? {
       return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToDark(){
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYourColorHere(){
        let userDefaults = UserDefaults.standard
        userDefaults.set("Blue", forKey: themePreferenceKey)
    }
    
 
}

