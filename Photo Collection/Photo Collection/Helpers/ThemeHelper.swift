//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Dillon McElhinney on 9/6/18.
//  Copyright © 2018 Dillon McElhinney. All rights reserved.
//

import UIKit

class ThemeHelper {
    
    // MARK: - Properties
    let themePreferenceKey = "ThemePreference"
    
    static var bodyTextColor: UIColor = .black
    static var backgroundColor: UIColor = .white
    static var navBarColor: UIBarStyle = .default
    
    // MARK: - Initializers
    init() {
        if themePreference == nil {
            setThemePreferenceToLight()
        }
    }
    
    // MARK: - Utility Functions
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
        ThemeHelper.bodyTextColor = .white
        ThemeHelper.backgroundColor = .darkGray
        ThemeHelper.navBarColor = .black
    }
    
    func setThemePreferenceToLight() {
        UserDefaults.standard.set("Light", forKey: themePreferenceKey)
        ThemeHelper.bodyTextColor = .black
        ThemeHelper.backgroundColor = .white
        ThemeHelper.navBarColor = .default
    }
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
}
