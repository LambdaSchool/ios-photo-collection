//
//  ThemeHelper.swift
//  Photo-IOSPT4
//
//  Created by David Williams on 12/11/19.
//  Copyright © 2019 david williams. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    var themePreferenceKey: String
    
    init(themePreferenceKey: String){
        self.themePreferenceKey = themePreferenceKey
    }
    
    func setThemePreferenceToDark() {
       // let userDefaults = UserDefaults.standard
        UserDefaults.standard.register(defaults: ["Dark" : themePreferenceKey])
    }
    
    func setThemePreferenceToYourColorHere() {
       // let userDefaults = UserDefaults.standard
        UserDefaults.standard.register(defaults: ["Green" : themePreferenceKey])
    }
    
    var themePreference: String {
        let userDefaults = UserDefaults.standard
        let theme = userDefaults.string(forKey: themePreferenceKey)
        guard let themeKey = theme else { return "" }
        return themeKey
    }
    
}
