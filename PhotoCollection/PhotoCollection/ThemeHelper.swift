//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Bradley Diroff on 2/27/20.
//  Copyright © 2020 Bradley Diroff. All rights reserved.
//

import UIKit

class ThemeHelper {
    let themePreferenceKey: String
    
    var themePreference: String? {
        let color = UserDefaults.standard.string(forKey: themePreferenceKey)
        print("THIS IS THE THEME PREFERENCE: \(color!)")
        return color
    }
    
    init(themePreferenceKey: String) {
        self.themePreferenceKey = themePreferenceKey
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        UserDefaults.standard.set("Blue", forKey: themePreferenceKey)
    }
}
