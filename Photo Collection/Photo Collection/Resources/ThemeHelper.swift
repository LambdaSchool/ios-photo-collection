//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Jon Bash on 2019-10-17.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import Foundation
import UIKit

class ThemeHelper {
    
    // MARK: - Properties
    
    let themePreferenceKey = "ThemePreference"
    
    var themePreference: ThemePreference? {
        guard let themePrefRawValue = UserDefaults.standard.string(forKey: themePreferenceKey)
            else { return nil }
        return ThemePreference.init(rawValue: themePrefRawValue)
    }
    
    // MARK: - Methods
    
    init() {
        if themePreference == nil {
            setTheme(to: .blue)
        }
    }
    
    func setTheme(to preference: ThemePreference) {
        UserDefaults.standard.set(preference.rawValue, forKey: themePreferenceKey)
    }
    
    func setTheme(for view: UIView) {
        guard let themePref = themePreference else { return }
        
        switch themePref {
        case .blue:
            view.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 1.0, alpha: 1.0)
        case .dark:
            view.backgroundColor = UIColor.darkGray
        }
    }
}

enum ThemePreference: String {
    case blue = "Blue"
    case dark = "Dark"
}
