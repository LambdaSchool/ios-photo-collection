//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Angel Buenrostro on 1/16/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    let themePreferenceKey : String = "Dark"
    
    
    func setThemePreferenceToDark(){
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYourColorHere(){
        UserDefaults.standard.set("Blue", forKey: themePreferenceKey)
    }
    
    var themePreference : String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    init() {
        if themePreference != nil { return }
        else {
            setThemePreferenceToYourColorHere()
        }
    }
}
