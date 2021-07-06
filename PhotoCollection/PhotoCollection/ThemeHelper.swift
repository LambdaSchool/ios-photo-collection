//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Kobe McKee on 5/9/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import Foundation

extension String {
    static var themePreferenceKey = "themePreferenceKey"
}

class ThemeHelper {
    
    
    init() {
        if themePreference == "" {
            setThemePreferenceToDark()
        }
    }
    
    
    var themePreference: String {
        let userDefaults = UserDefaults.standard
        guard let theme = userDefaults.string(forKey: .themePreferenceKey) else { return "" }
        return theme
    }
    
    
    func setThemePreferenceToDark() {
        
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: .themePreferenceKey)
        
    }
    
    
    func setThemePreferenceToBlue() {
        
        let userDefaults = UserDefaults.standard
        userDefaults.set("Blue", forKey: .themePreferenceKey)
    }
    
    
}
