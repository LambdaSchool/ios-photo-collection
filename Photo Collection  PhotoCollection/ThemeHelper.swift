//
//  ThemeHelper.swift
//  Photo Collection  PhotoCollection
//
//  Created by Andrew Ruiz on 7/25/19.
//  Copyright © 2019 Andrew Ruiz. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    #warning("Not sure if we have to set to empty string.")
    var themePreferenceKey: String = ""
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark",forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYourColorHere() {
        UserDefaults.standard.set("Light",forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    
    init() {
        
    
        if let unwrappedThemePreference = themePreference {
            print("")
        } else {
            setThemePreferenceToDark()
        }
        
        guard themePreference == nil else { return }
            setThemePreferenceToDark()
        
        }
}
