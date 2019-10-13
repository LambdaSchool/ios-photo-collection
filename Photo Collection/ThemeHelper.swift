//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Alex Thompson on 10/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

enum Theme: String {
    case light
    case dark
    case black
    
}

class ThemeHelper {
    private (set) lazy var themePreferenceKey = loadTheme()
    private let defaults: UserDefaults
    private let defaultsKey = "theme"
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }

    func setThemeToDark(to theme: Theme) {
        themePreferenceKey = theme
        defaults.setValue(theme.rawValue, forKey: defaultsKey)
    }
    
    private func loadTheme() -> Theme {
        let rawValue = defaults.string(forKey: defaultsKey)
        return rawValue.flatMap(Theme.init) ?? .dark
    }
    
}

