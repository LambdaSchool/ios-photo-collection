//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by David Wright on 12/12/19.
//  Copyright © 2019 David Wright. All rights reserved.
//

import UIKit

class ThemeHelper {
    
    // MARK: - Properties
    
    let themePreferenceKey: String = "ThemePreference"
    
    var themePreference: String? {
        let userDefaults = UserDefaults.standard
        let theme = userDefaults.string(forKey: themePreferenceKey)
        return theme
    }
    
    var themeColor: UIColor {
        //guard let themeString = themePreference else { return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) }
        switch themePreference {
        case "Dark":
            return #colorLiteral(red: 0.1686089337, green: 0.1686392725, blue: 0.1686023176, alpha: 1)
        case "Light":
            return #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        default:
            return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    // MARK: - Methods

    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToLight() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Light", forKey: themePreferenceKey)
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToLight()
        }
    }
}
