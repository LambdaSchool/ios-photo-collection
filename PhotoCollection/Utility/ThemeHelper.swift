//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Brian Rouse on 4/22/20.
//  Copyright © 2020 Brian Rouse. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey: String = "themePreferenceKey"
    
    init() {
        guard (UserDefaults.standard.value(forKey: self.themePreferenceKey) as? String) != nil else {
            self.setThemePreferenceToDark()
            return
        }
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.setValue("Dark", forKey: self.themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        UserDefaults.standard.setValue("Blue", forKey: self.themePreferenceKey)
    }
    
    func getCurrentSelectedTheme() -> String {
        return UserDefaults.standard.value(forKey: self.themePreferenceKey) as? String ?? ""
    }
}
