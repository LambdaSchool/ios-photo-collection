//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Iyin Raphael on 8/9/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import Foundation


class ThemeHelper {
    
    let themePreferenceKey = "themeChange"
    let userDefaults = UserDefaults.standard
    
    func setThemePreferenceToDark(){
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYourColorHere(){
        userDefaults.set("Red", forKey: themePreferenceKey)
    }
    
    var themePrefence: String? {
        if let themeString = userDefaults.string(forKey: themePreferenceKey) {
            return themeString
        }else{
            return nil
        }
    }
}
