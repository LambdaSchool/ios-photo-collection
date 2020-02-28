//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Lydia Zhang on 2/27/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

import Foundation

private let themePreferenceKey: String = "themepreferenceKey"

class ThemeHelper {
    

    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey )
    }
    func setThemePreferenceToYourColorHere() {
        UserDefaults.standard.set("Purple", forKey: themePreferenceKey)
    }
    
    var themePreference: String? = UserDefaults.standard.string(forKey: themePreferenceKey) ?? "Dark"
    
}
