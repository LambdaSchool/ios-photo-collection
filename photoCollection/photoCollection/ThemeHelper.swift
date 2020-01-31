//
//  ThemeHelper.swift
//  photoCollection
//
//  Created by beth on 1/30/20.
//  Copyright © 2020 elizabeth wingate. All rights reserved.
//

import Foundation

//step 1
class ThemeHelper {

//step 2 and 5 
    var themePreferenceKey: String? {
        return UserDefaults.standard.string(forKey: .themePreference)
}
//step 6
    init() {
        if themePreferenceKey == nil {
            setThemePreferenceToWhite()
        }
    }

    struct PropertyKeys {
        static let dark = "Dark"
        static let white = "White"
    }
    
//step 3
    func setThemePreferenceToDark() {
        UserDefaults.standard.set(PropertyKeys.dark, forKey: .themePreference)
    }
//step 4
    func setThemePreferenceToWhite() {
        UserDefaults.standard.set(PropertyKeys.white, forKey: .themePreference)
    }
}

extension String {
    static var themePreference = "themePreference"
}
