//
//  ThemeHelper.swift
//  PhotoIOSPT5
//
//  Created by David Williams on 2/19/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    var themePreferenceKey: String = ""
    var themePrefer: String = ""
    
    init() {
        if themePrefer == .themePreferenceDark {
            themePrefer = .themePreferenceDark
        } else if themePrefer == .themePreferenceGreen {
            themePrefer = .themePreferenceGreen
        } else if themePrefer == "" {
            themePrefer = .themePreferenceGreen
        }
    }

    
    func setThemePreferenceToDark() {
       themePrefer =  (UserDefaults.standard.string(forKey: .themePreferenceDark)) ?? ""
        print(themePrefer)
    }
    
    func setThemePreferenceToGreen() {
        themePrefer =  (UserDefaults.standard.string(forKey: .themePreferenceGreen)) ?? ""
        print(themePrefer)
    }
    
    var themePreference: String? {
        let userDefaults = UserDefaults.standard
        let theme = userDefaults.string(forKey: themePrefer)
        guard let themeKey = theme else { return "" }
        return themeKey
    }
}
