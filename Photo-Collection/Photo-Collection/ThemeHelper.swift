//
//  ThemeHelper.swift
//  Photo-Collection
//
//  Created by Ilgar Ilyasov on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    // MARK: Initializer
    
    init() {
        if themePreference == nil {
            setThemePreferenceToAqua()
        } else {
            setThemePreferenceToDark()
        }
    }
    
    // MARK: - Properties
    
    //let themePreferenceKey = "UserThemePreference"
    
    // MARK: - Computed properties
    
    var themePreference: String? {
        let defaults = UserDefaults.standard
        return defaults.string(forKey: .themePreferenceKey)
    }
    
    // MARK: -Functions
    
    func setThemePreferenceToDark() {
        let defaults = UserDefaults.standard
        defaults.set("Dark", forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToAqua() {
        let defaults = UserDefaults.standard
        defaults.set("Aqua", forKey: .themePreferenceKey)
    }
}

extension String {
    static var themePreferenceKey = "UserThemePreference"
}
