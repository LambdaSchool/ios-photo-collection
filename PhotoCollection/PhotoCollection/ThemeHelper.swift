//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Bradley Yin on 7/25/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey: String = "ThemePreference"
    
    let userDefault = UserDefaults.standard
    
    
    var themePreference : String?{
       return userDefault.string(forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToDark(){
        
        userDefault.set("Dark", forKey: themePreferenceKey)
        
    }
    
    func setThemePreferenceToWhite(){
        
        userDefault.set("White", forKey: themePreferenceKey)
        
    }
}
