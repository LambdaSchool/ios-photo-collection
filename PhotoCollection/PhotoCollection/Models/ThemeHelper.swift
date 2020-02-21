//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Lambda_School_Loaner_259 on 2/19/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey = "themePreference"
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToLight() {
        UserDefaults.standard.set("Light", forKey: themePreferenceKey)
    }
    
    init(themePreference: String?) {
          guard themePreference == nil else { return }
              setThemePreferenceToDark()
    }
}
