//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Kenny on 12/19/19.
//  Copyright © 2019 Hazy Studios. All rights reserved.
//

import Foundation


class ThemeHelper {
    //MARK: Class Properties
    private let userDefaults = UserDefaults.standard
    
    var themePreference: String? {
        //print(userDefaults.string(forKey: .themePreferenceKey))
        return userDefaults.string(forKey: .themePreferenceKey)
    }
    
    //MARK: Helper Methods
    func setThemePreferenceToDark() {
        //print(userDefaults.string(forKey: .themePreferenceKey))
        userDefaults.set("Dark", forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToLight() {
        //print(userDefaults.string(forKey: .themePreferenceKey))
        userDefaults.set("Light", forKey: .themePreferenceKey)
    }
    
    
    
    init() {
        if themePreference == nil {
            setThemePreferenceToLight()
        }
    }

    
}

extension String {
    static let themePreferenceKey = "themePreference"
}
