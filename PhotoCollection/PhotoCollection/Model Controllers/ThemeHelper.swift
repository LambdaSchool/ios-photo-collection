//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Cameron Collins on 3/26/20.
//  Copyright © 2020 Cameron Collins. All rights reserved.
//

import Foundation

//Enum
enum Themes: String {
    case dark = "dark"
    case blue = "blue"
}


//Theme Helper
/** Gets and Sets Users Theme Preferences. Saves Preferences Using UserDefaults
*/
class ThemeHelper {
    var themePreferenceKey = "My_Photo"
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set(Themes.dark.rawValue, forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYourColorHere() {
    UserDefaults.standard.set(Themes.blue.rawValue, forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        let myPreference: String? = UserDefaults.standard.string(forKey: themePreferenceKey)
        return myPreference
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
}
