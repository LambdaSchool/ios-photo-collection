//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Joshua Sharp on 8/22/19.
//  Copyright © 2019 Joshua Sharp. All rights reserved.
//

import Foundation
import UIKit

enum ThemeColor: String, CaseIterable {
    case dark = "Dark"
    case light = "Light"
    case blue = "Blue"
}

class ThemeHelper {
    let themePreferenceKey: String = "themePreferenceKey"
    
    var themePreference: ThemeColor? {
        if let result = UserDefaults.standard.object(forKey: themePreferenceKey) {
            let result = ThemeColor (rawValue: result as! String)
            return result
        } else {
            return nil
        }
    }
    
    func setThemePreference (to color: ThemeColor) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(color.rawValue, forKey: themePreferenceKey)
    }
    
    init (default color: ThemeColor = .dark) {
        if themePreference == nil {
            setThemePreference(to: color)
        }
    }
    
    func setTheme(view: UIView) {
        guard let theme = self.themePreference else { return }
        switch theme {
        case .blue:
            view.backgroundColor = .blue
        case .dark:
            view.backgroundColor = .darkGray
        case .light:
            view.backgroundColor = .white
        }
    }
}
