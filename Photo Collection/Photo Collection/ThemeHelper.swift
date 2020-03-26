//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Chris Dobek on 3/26/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey: String = "themePreferenceKey"
    var themePreference: String? {
        UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToDark(){
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToLight() {
        UserDefaults.standard.set("Light", forKey: themePreferenceKey)
    }
    
    init(){
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
}
