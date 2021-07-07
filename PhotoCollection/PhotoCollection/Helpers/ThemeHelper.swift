//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Rick Wolter on 9/13/18.
//  Copyright © 2018 RNWolter. All rights reserved.
//

import Foundation


class ThemeHelper {

    
    init(){
        if themePreference == nil { setThemePreferenceToDark() }
    }
    let defaults = UserDefaults.standard
    let themePreferenceKey: String
    
    var themePreference: String? {
        return defaults.string(forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToDark() {
        
        defaults.set("dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToBlue(){
        
        defaults.set("blue", forKey: themePreferenceKey)
    }
    
    
    
}
