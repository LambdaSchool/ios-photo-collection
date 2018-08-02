//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Simon Elhoej Steinmejer on 02/08/18.
//  Copyright © 2018 Simon Elhoej Steinmejer. All rights reserved.
//

import Foundation

class ThemeHelper
{
    let themePreferenceKey = "themePreferenceKey"
    let userDefaults = UserDefaults.standard
    
    var themePreference: String?
    {
        get
        {
            return userDefaults.string(forKey: themePreferenceKey)
        }
    }
    
    init()
    {
        if themePreference == nil
        {
            setThemePreferenceToDark()
        }
    }

    func setThemePreferenceToDark()
    {
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToBlue()
    {
        userDefaults.set("Blue", forKey: themePreferenceKey)
    }
}
