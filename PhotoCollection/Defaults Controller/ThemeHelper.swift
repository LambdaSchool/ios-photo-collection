//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Chris Gonzales on 1/30/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

import Foundation

class ThemeHelper{
    
    let themePreferenceKey: String = "themePreferenceKey"
    
    func setThemePreferenceToDark(){
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToGreen(){
        UserDefaults.standard.set("Green", forKey: themePreferenceKey)
    }
    
    var themePreference: String?{
         return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    init() {
        guard themePreference == nil else { return }
            setThemePreferenceToGreen()
        
    }
    
}
