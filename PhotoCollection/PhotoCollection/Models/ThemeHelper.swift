//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Karen Rodriguez on 2/26/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey: String
    var themePreference: String? {
        get {
            return UserDefaults.standard.string(forKey: themePreferenceKey)
        }
    }
    
    //MARK: - Initializer
    
    init(themePreferenceKey: String) {
        self.themePreferenceKey = themePreferenceKey
        if self.themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    //MARK: - Methods
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: self.themePreferenceKey)
    }
    func setThemePreferenceToGreen() {
        UserDefaults.standard.set("Green", forKey: self.themePreferenceKey)
    }
    
}
