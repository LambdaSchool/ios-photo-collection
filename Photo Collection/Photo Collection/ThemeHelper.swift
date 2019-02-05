//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Cameron Dunn on 1/16/19.
//  Copyright © 2019 Cameron Dunn. All rights reserved.
//
extension String{
    static var dark = "Dark"
    static var light = "Light"
}
import Foundation

class ThemeHelper{
    var themePreferenceKey : String = "ThemePreference"
    
    var themePreference : String?{
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    init(){
        if(themePreference == nil){
            setThemePreferenceToLight()
        }
    }
    func setThemePreferenceToDark(){
        UserDefaults.standard.set(String.dark, forKey: themePreferenceKey)
    }
    func setThemePreferenceToLight(){
        UserDefaults.standard.set(String.light, forKey: themePreferenceKey)
    }
}
