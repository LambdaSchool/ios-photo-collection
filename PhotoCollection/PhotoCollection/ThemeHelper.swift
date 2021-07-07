//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Bradley Yin on 7/25/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

import Foundation
import UIKit

class ThemeHelper {
    let themePreferenceKey: String = "ThemePreference"
    
    let userDefault = UserDefaults.standard
    
    
    var themePreference : String?{
       return userDefault.string(forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToDark(){
        
        userDefault.set("Dark", forKey: themePreferenceKey)
        
    }
    
    func setThemePreferenceToBlue(){
        
        userDefault.set("Blue", forKey: themePreferenceKey)
        
    }
    
    func setTheme() -> UIColor {
        guard let themePreference = themePreference else { return UIColor.white }
        if themePreference == "Dark" {
            return UIColor.black
        } else {
            return UIColor.blue
        }
    }
}
