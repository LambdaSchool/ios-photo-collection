//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Norlan Tibanear on 6/11/20.
//  Copyright © 2020 Norlan Tibanear. All rights reserved.
//

import Foundation

class ThemHelper {
    
    let themePreferenceKey = "themePreferenceKey"
    
    
    init() {
        
        guard (UserDefaults.standard.value(forKey: self.themePreferenceKey) as? String) != nil else
        {
             self.setThemePreferenceToLight()
            return
        }
        
//        if themePreference == nil {
//            setThemePreferenceToDark()
//        }
    }
    
    var themePreference: String? {
        if let themPreference = UserDefaults.standard.string(forKey: themePreferenceKey) {
            return themPreference
        } else {
            return nil
        }
    }
    
   
    
    func setThemePreferenceToDark() {
        let defaults = UserDefaults.standard
        defaults.setValue("Dark", forKey: themePreferenceKey)
    }
    
    
    func setThemePreferenceToLight() {
        let defaults = UserDefaults.standard
        defaults.setValue("Light", forKey: themePreferenceKey)
    }
    

    
    
} // END
