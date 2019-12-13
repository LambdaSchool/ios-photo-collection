//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Morgan Smith on 12/12/19.
//  Copyright © 2019 Morgan Smith. All rights reserved.
//

import Foundation

class ThemeHelper {
  
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(_: "Dark", forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToYourColorHere() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(_: "Blue", forKey: .themePreferenceKey)
    }
    
    var themePreference: String? {
        if let stringValue = UserDefaults.standard.string(forKey: .themePreferenceKey) {
            return stringValue
        } else {
            return nil
        }
    }
    
    init(themePreference: String?) {
        if themePreference == nil {
            setThemePreferenceToDark()
        } else {
            return
        }
    }
}

extension String {
    static var themePreferenceKey = "ThemePreferenceKey"
}
