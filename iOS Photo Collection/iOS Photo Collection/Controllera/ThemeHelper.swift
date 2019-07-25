//
//  ThemeHelper.swift
//  iOS Photo Collection
//
//  Created by Jake Connerly on 7/25/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    //
    //MARK: - Properties
    //
    
    static let themePreferenceKey: String = ""
    
    var themePreference: String? {
        let userDefaults = UserDefaults.standard
        let preference = userDefaults.string(forKey: ThemeHelper.themePreferenceKey)
        return preference
    }
    
    //
    // MARK: - Methods
    //
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: ThemeHelper.themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Blue", forKey: ThemeHelper.themePreferenceKey)
    }
    
    #warning("Check later if correct")
    
        init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
        
    }
    
}
