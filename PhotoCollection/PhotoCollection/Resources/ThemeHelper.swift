//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Shawn James on 3/26/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    // MARK: - ThemePreference Property
    var themePreference: String? { UserDefaults.standard.string(forKey: .themePreferenceKey) ?? String.redTheme}
    
    
    // MARK: - Methods To Set Theme
    
    func setThemeToRed() { UserDefaults.standard.set(String.redTheme , forKey: .themePreferenceKey) }
    func setThemeToBlue() { UserDefaults.standard.set(String.blueTheme, forKey: .themePreferenceKey) }
    
    
    // MARK: - Initializer
    init() { if themePreference == nil { setThemeToRed() } }
    
}

// MARK: - String Extensions
extension String {
    static let themePreferenceKey = "ThemePreferenceKey"
    static let redTheme = "Red"
    static let blueTheme = "Blue"
}
