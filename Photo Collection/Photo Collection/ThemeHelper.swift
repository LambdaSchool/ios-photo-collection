//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Cameron Dunn on 1/16/19.
//  Copyright © 2019 Cameron Dunn. All rights reserved.
//

import Foundation

class ThemeHelper{
    var themePreferenceKey : String = "ThemePreference"
    enum themes : String{
        case Dark
        case Light
    }
    var themePreference : String?{
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    init(){
        if(themePreference == nil){
            setThemePreferenceToLight()
        }
    }
    func setThemePreferenceToDark(){
        UserDefaults.standard.set(themes.Dark, forKey: themePreferenceKey)
    }
    func setThemePreferenceToLight(){
        UserDefaults.standard.set(themes.Light, forKey: themePreferenceKey)
    }
}
