//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Harmony Radley on 2/27/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

import Foundation

extension String {
    static let themePreferenceKey = "themePreferenceKey"
}


class ThemeHelper {
  
    
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToYourColorHere() {
        UserDefaults.standard.set("Blue", forKey: .themePreferenceKey)
    }
    
    
    var themePreference: String? {
        UserDefaults.standard.string(forKey: .themePreferenceKey)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
