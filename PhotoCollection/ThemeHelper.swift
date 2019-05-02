//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Alex Perse on 5/2/19.
//  Copyright © 2019 Alex Perse. All rights reserved.
//

import UIKit

class ThemeHelper {
    let themePreferenceKey: String
    
    // Computed properties must use var not let as they can change
    var themePreference: String? {
        get {
            return UserDefaults.standard.string(forKey: themePreferenceKey)
        }
    }

    init() {
        // If themePreferenceKey is nil it means it's the first time a user has opened the app.
        
        //Give a dummy value to themePreferenceKey
        self.themePreferenceKey = "-1"
        
        if self.themePreference == nil
        {
            self.setThemePreferenceToDark()
        }
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set(String.dark, forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        UserDefaults.standard.set(String.blue, forKey: themePreferenceKey)
    }
    
}
extension String {
    static var dark = "Dark"
    static var blue = "Blue"
}
