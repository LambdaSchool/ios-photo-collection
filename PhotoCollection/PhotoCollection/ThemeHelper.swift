//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Carolyn Lea on 8/2/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import Foundation

class ThemeHelper
{
    let themePreferencKey = "ThemePreferenceKey"
    let userDefaults = UserDefaults.standard
    var themePreference:String?
    {
        return userDefaults.string(forKey: themePreferencKey)
    }
    
    init(themePreference: String, preferenceKey: String)
    {
        if userDefaults.string(forKey: themePreference) == nil
        {
            setThemePreferenceToThemeOne()
        }
    }
    
    func setThemePreferenceToThemeOne()
    {
        userDefaults.set("ThemeOne", forKey: themePreferencKey)
    }
    
    func setThemePreferenceToThemeTwo()
    {
        userDefaults.set("ThemeTwo", forKey: themePreferencKey)
    }
}
