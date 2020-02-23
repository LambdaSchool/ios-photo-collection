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
    //"Blue", "Dark", "Green", "Indigo", "Orange", "Red"
    init() {
        themePrefer = .themePreferenceIndigo
    }
    
    func setThemePreferenceToBlue() {
        themePrefer = (UserDefaults.standard.string(forKey: .themePreferenceBlue)) ?? ""
    }
    
    func setThemePreferenceToDark() {
        themePrefer = (UserDefaults.standard.string(forKey: .themePreferenceDark)) ?? ""
    }
    
    func setThemePreferenceToGreen() {
        themePrefer = (UserDefaults.standard.string(forKey: .themePreferenceGreen)) ?? ""
    }
    
    func setThemePreferenceToIndigo() {
        themePrefer = (UserDefaults.standard.string(forKey: .themePreferenceIndigo)) ?? ""
    }
    
    func setThemePreferenceToOrange() {
        themePrefer = (UserDefaults.standard.string(forKey: .themePreferenceOrange)) ?? ""
    }
    
    func setThemePreferenceToRed() {
        themePrefer = (UserDefaults.standard.string(forKey: .themePreferenceRed)) ?? ""
    }
    
    var themePreference: String? {
        let userDefaults = UserDefaults.standard
        let theme = userDefaults.string(forKey: themePrefer)
        guard let themeKey = theme else { return "" }
        return themeKey
    }
}
