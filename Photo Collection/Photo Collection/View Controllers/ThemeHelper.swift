//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by macbook on 9/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


class ThemeHelper {
   
    
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: .themePreferenceKey)
    }
//    ^^ should return an optional string because if the user's theme preference hasn't been saved, the value returned from UserDefaults will be nil.
    
    func setThemePreferenceToDark() {
        
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToGreen() {
        
        let userDefaults = UserDefaults.standard
        userDefaults.set("Green", forKey: .themePreferenceKey)
    }
    
    
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        } else {
            return
        }
    }
}


