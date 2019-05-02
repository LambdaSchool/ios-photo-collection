//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Alex Perse on 5/2/19.
//  Copyright © 2019 Alex Perse. All rights reserved.
//

import UIKit

class ThemeHelper {
    
    let themePreferenceKey: String
    let userDefaults = UserDefaults.standard
    
    init(themePreferenceKey: String) {
        self.themePreferenceKey = themePreferenceKey
        //Check if themePreference value is nil. If it is, call one of the setThemePreferences
    }
    
    func setThemePreferenceToDark() {
        userDefaults.setValue("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        userDefaults.setValue("Blue", forKey: themePreferenceKey)
    }
    
    func themePreference() -> String? {
        return userDefaults.string(forKey: themePreferenceKey)
    
    }
    
}
