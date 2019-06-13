//
//  ThemeHelper.swift
//  ios-photo-collection
//
//  Created by Alex Shillingford on 6/13/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey = "Key"
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    init() {
        guard themePreference == nil else { return }
        setThemePreferenceToBlue()
//        self.themePreferenceKey = themePreferenceKey
//        if let unwrappedThemePreference = themePreference {
//            self.themePreference = unwrappedThemePreference
//        } else {
//            themePreference =
//        }
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        UserDefaults.standard.set("Blue", forKey: themePreferenceKey)
    }
}
