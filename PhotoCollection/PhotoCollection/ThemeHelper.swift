//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Gerardo Hernandez on 12/12/19.
//  Copyright © 2019 Gerardo Hernandez. All rights reserved.
//

import Foundation

enum Theme: String {
       case dark = "Dark"
       case white = "White"
       case green = "Green"
   }

class ThemHelper {
    
    var themePreference: String? {
        if let preference = UserDefaults.standard.string(forKey: .themePreferenceKey) {
        return preference 
    }
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        UserDefaults.standard.set(Theme.dark, forKey: .themePreferenceKey)
        
    }
    
    func setThemePreferenceToYourColorHere() {
        let userDefaults = UserDefaults.standard
        UserDefaults.standard.set(Theme.white, forKey: .themePreferenceKey)
    
   
}
    
    
}
}
extension String {
    static var themePreferenceKey = "themePreferenceKey"
    
}
