//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Shawn James on 2/27/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

import Foundation

class ThemeHelper {
    // MARK: - Properties
    // this will be used whenever you need to save the user's theme preference or get it from UserDefaults
    var themePreferenceKey: String
    
    // MARK: - Methods
    func setThemePreferenceToDark() {
        // FIXME: - Using the `set` method of `UserDefaults` (remember that in order to access `set`, you have to use the `standard` property on `UserDefaults`), set the string "Dark" as the value, and the `themePreferenceKey` as the key.
        UserDefaults.`standard`.set
    }
    
}
