//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Lambda_School_loaner_226 on 12/19/19.
//  Copyright © 2019 JamesMcDougall. All rights reserved.
//

import UIKit

class ThemeHelper
{

    let themePreferenceKey: String
 
    func setThemePreferenceToDark()
    {
        let darkDefault = UserDefaults()
        darkDefault.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePrefeferenceToYourColorHere()
    {
        let customDefault = UserDefaults()
        customDefault.set("Light", forKey: themePreferenceKey)
    }
    
    var themePreference:String?
    {
        let userDarkDefault = UserDefaults()
        userDarkDefault.string(forKey: "Dark")
        
    }
}
