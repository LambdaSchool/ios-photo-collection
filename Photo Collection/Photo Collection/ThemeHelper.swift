//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Iyin Raphael on 8/9/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import Foundation


class ThemeHelper {
    
    let themePreferenceKey = "saveThemePreference"
    let userDefaults = UserDefaults.standard
    
    func setThemePreferenceToDark(){
        return userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYourColorHere(){
        return userDefaults.set("Blue", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        if let themePreferenceString = userDefaults.string(forKey: themePreferenceKey){
            return themePreferenceString
        }else{
            return nil
        }
        
    }
    
    
    init(){
        if themePreference == nil{
            setThemePreferenceToYourColorHere()
        }
    }
}
