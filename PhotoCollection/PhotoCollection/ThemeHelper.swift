//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by David Wright on 12/12/19.
//  Copyright © 2019 David Wright. All rights reserved.
//

import UIKit

class ThemeHelper {
    
    enum Theme: Int {
        case dark, light
    }
    
    // MARK: - Public Properties
    
    var theme: Theme {
        get {
            guard let rawValue = defaults.value(forKey: themeKey) as? Int,
                  let theme = Theme(rawValue: rawValue) else { return .light }
            return theme
        }
        set {
            defaults.set(newValue.rawValue, forKey: themeKey)
        }
    }
    
    var backgroundColor: UIColor {
        switch theme {
        case .dark: return #colorLiteral(red: 0.1686089337, green: 0.1686392725, blue: 0.1686023176, alpha: 1)
        case .light: return #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }
    }
    
    // MARK: - Private Properties
    
    private let defaults = UserDefaults.standard
    
    private let themeKey: String = "UserDefaultsThemeKey"
    
}
