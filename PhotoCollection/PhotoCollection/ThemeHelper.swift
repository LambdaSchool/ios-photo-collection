//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Lambda_School_Loaner_204 on 10/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

extension String {
    static var themePreferenceKey = "ThemePreferenceKey"
}

class ThemeHelper {
    
    // MARK: Properties
    
    var themePreference: String? {
        let themePreference = UserDefaults.standard.string(forKey: .themePreferenceKey)
        return themePreference
    }
    
    // MARK: - Init
    init() {
        if(themePreference == nil) {
            setThemePreferenceToDark()
        }
    }

    // MARK: - Class functions
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToYourColorHere() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Blue", forKey: .themePreferenceKey)
    }
}
