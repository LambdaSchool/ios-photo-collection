//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Thomas Cacciatore on 5/2/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

import Foundation

extension String {
    static let themePreferenceKey = "themePreferenceKey"
}

class ThemeHelper {
    let themePreferenceKey: String = .themePreferenceKey
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: .themePreferenceKey)
    }
    
    init(/*themePreferenceKey: String, themePreference: String?*/) {
//        self.themePreferenceKey = themePreferenceKey
        if themePreference == nil {
            setThemePreferenceToPurple()
        }
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToPurple() {
        UserDefaults.standard.set("Purple", forKey: .themePreferenceKey)
    }
}
