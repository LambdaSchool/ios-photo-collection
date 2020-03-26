//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Hunter Oppel on 3/26/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    // MARK: Properties
    
    let themePreferenceKey = "ThemePreferenceKey"
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    // MARK: Set theme preference
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        UserDefaults.standard.set("White", forKey: themePreferenceKey)
    }
    
    init() {
        if let _ = themePreference {
            return
        } else {
            setThemePreferenceToDark()
        }
    }
}
