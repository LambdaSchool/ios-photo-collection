//
//  ThemeHelper.swift
//  PhotosCollection
//
//  Created by Mike Nichols on 5/21/20.
//  Copyright © 2020 Mike Nichols. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    let themePreferenceKey: String
    
    var themePreference: String? {
        let themeString = UserDefaults.standard.string(forKey: themePreferenceKey)
        return themeString
    }
    
    init(themePreferenceKey: String) {
        if themePreference != nil {
            setThemePreferencetoBlue()
        }
    }
    
    func setThemePreferencetoDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferencetoBlue() {
        UserDefaults.standard.set("Blue", forKey: themePreferenceKey)
    }
}
