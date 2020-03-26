//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Nihal Erdal on 3/24/20.
//  Copyright © 2020 Nihal Erdal. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    
    let themePreferenceKey = "themePreference"
    

    
    func setThemePreferenceToDark(){
        
        
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
        
    }
    
    func setThemePreferenceToYourColorHere(){
        
        UserDefaults.standard.set("Blue", forKey: themePreferenceKey)
       
    }
    
    
    var themePreference : String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
        
    }
    
    init(){
        
        guard themePreference == nil else {return}
        setThemePreferenceToYourColorHere()
    }
    
    
}

