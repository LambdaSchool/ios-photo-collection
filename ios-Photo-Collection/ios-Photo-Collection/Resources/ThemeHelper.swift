//
//  ThemeHelper.swift
//  ios-Photo-Collection
//
//  Created by LambdaSchoolVM_Catalina on 12/12/19.
//  Copyright © 2019 Sal Amer. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    var themePreference: String? {
        let themePreference = UserDefaults.standard.string(forKey: .themePreferenceKey)
        return themePreference
    }
    
    init() {
        if themePreference == nil {
        setThemePreferenceToDark()
        }
    }
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: .themePreferenceKey )
    }
    
    func setThemePreferenceToRed() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Red", forKey: .themePreferenceKey)
    }
    
}

extension String {
     static var themePreferenceKey = "ThemePreferenceKey"
}
