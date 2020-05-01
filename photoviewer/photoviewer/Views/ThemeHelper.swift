//
//  ThemeHelper.swift
//  photoviewer
//
//  Created by Ian French on 4/30/20.
//  Copyright © 2020 Ian French. All rights reserved.
//

import Foundation


class ThemeHelper {
    
    let themePreferenceKey = "ThemePreference"
    
    func setThemePreferenceToDark() {
       
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
        
    }
    
    func setThemePreferenceToGreen() {
           UserDefaults.standard.set("Green", forKey: themePreferenceKey)
       }
       
    
    
    var themePreference: String? {
        
        
        return UserDefaults.standard.string(forKey: themePreferenceKey)
        
    }
    
    
    
    init() {
        
        if themePreference == nil {
        setThemePreferenceToDark()
        }
     }

}
