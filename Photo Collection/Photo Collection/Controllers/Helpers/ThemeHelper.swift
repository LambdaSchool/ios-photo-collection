//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Cody Morley on 8/3/20.
//  Copyright © 2020 Cody Morley. All rights reserved.
//

import Foundation

class ThemeHelper {
    //MARK: - Properties -
    /// Keys
    private let themePreferenceKey: String = "PreferredTheme"
    ///Values
    let darkValue = "Dark"
    let lambdaValue = "Lambda"
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    
    //MARK: - Initializers -
    init() {
        if themePreference == nil {
            setThemePreferenceToLambda()
        }
    }
    
    
    //MARK: - Actions -
    func setThemePreferenceToDark() {
        UserDefaults.standard.set(darkValue, forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToLambda() {
        UserDefaults.standard.set(lambdaValue, forKey: themePreferenceKey)
    }
}
