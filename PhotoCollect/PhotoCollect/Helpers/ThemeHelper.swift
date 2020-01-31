//
//  ThemeHelper.swift
//  PhotoCollect
//
//  Created by Nick Nguyen on 1/30/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

import Foundation
import UIKit


class ThemeHelper {
      let userDefaults = UserDefaults.standard
    
       let themeKey = "themePreferenceKey"
    init() {
        if themePreference != nil  {
           setThemePreferenceToDark()
        } 
    }
    
    func setThemePreferenceToDark() {
        userDefaults.set("Dark", forKey:themeKey )
    }
    
    func setThemePreferenceToLight() {
        userDefaults.set("Purple", forKey: themeKey)
    }
    var themePreference: String? {
        let result = userDefaults.string(forKey: themeKey)
        return result
    }
    
}
