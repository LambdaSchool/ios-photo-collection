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
    let themePreferenceKey = "ThemePreferenceKey"
    var themePreference:String?
    {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToDark()
    {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToPink()
    {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Pink", forKey: themePreferenceKey)
    }
}
