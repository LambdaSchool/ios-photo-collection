//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Jesse Ruiz on 9/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey: String
    
    init(themePreferenceKey: String) {
        self.themePreferenceKey = themePreferenceKey
    }
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToMaroon() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Maroon", forKey: themePreferenceKey)
    }
}
