//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Dojo on 6/13/20.
//  Copyright © 2020 Dojo. All rights reserved.
//

import UIKit

extension String {
    static let themePreferenceKey = "ThemePreference"
    static let light = "Light"
    static let dark = "Dark"
}

class ThemeHelper {
    // MARK: - Properties
    var themePreference: String? {
        if UserDefaults.standard.string(forKey: .themePreferenceKey) == .dark {
            return .dark
        } else {
            return .light
        }
    }

    init() {
        if themePreference == nil {
            setThemePreferenceToLight()
        }
    }

    // MARK: - Methods
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set(String.dark, forKey: .themePreferenceKey)
    }

    func setThemePreferenceToLight() {
        UserDefaults.standard.set(String.light, forKey: .themePreferenceKey)
    }


}
