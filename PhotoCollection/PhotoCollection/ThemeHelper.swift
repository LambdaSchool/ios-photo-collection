//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Shawn Gee on 2/27/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

private let themePreferenceKey = "themePreferenceKey"

class ThemeHelper {
    
    var delegate: ThemeHelperDelegate?
    
    // Themes
    static let darkTheme = "Dark"
    static let indigoTheme = "Indigo"
    
    var themePreference: String {
        return UserDefaults.standard.string(forKey: themePreferenceKey) ?? ThemeHelper.darkTheme
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set(ThemeHelper.darkTheme, forKey: themePreferenceKey)
        delegate?.themeDidChange(toTheme: ThemeHelper.darkTheme)
    }
    
    func setThemePreferenceToIndigo() {
        UserDefaults.standard.set(ThemeHelper.indigoTheme, forKey: themePreferenceKey)
        delegate?.themeDidChange(toTheme: ThemeHelper.indigoTheme)
    }
}

protocol ThemeHelperDelegate {
    func themeDidChange(toTheme theme: String)
}

extension ThemeHelperDelegate where Self: UIViewController {
    func themeDidChange(toTheme theme: String) {
        view.backgroundColor  = UIColor(named: theme)
    }
}
