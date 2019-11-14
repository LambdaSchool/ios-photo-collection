//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Tobi Kuyoro on 14/11/2019.
//  Copyright © 2019 Tobi Kuyoro. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    let themePreferenceKey: String
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYourColorHere() {
        UserDefaults.standard.set("Blue", forKey: themePreferenceKey)
    }
    
    init(themePreferenceKey: String, themePreference: String?) {
        self.themePreferenceKey = themePreferenceKey
        
        if themePreference == nil {
            self.setThemePreferenceToDark()
        }
    }
}
