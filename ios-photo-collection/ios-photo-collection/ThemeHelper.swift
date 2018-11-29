//
//  ThemeHelper.swift
//  ios-photo-collection
//
//  Created by Benjamin Hakes on 11/28/18.
//  Copyright © 2018 Benjamin Hakes. All rights reserved.
//

import Foundation
import UIKit

class ThemeHelper: UserDefaults {
    
    init (){
        super.init()
        if self.themePreference == nil { self.setThemePerferenceToDark()}
    }
    
    let themePreferenceKey: String = "themePreferenceKey"
    var themePreference: String? {
        return defaults.string(forKey: themePreferenceKey)
    }
    let defaults = UserDefaults.standard
    
    
    func setThemePerferenceToDark() {
        defaults.set("Dark", forKey: themePreferenceKey)
    }
    
    // TODO: Test this color to make sure it works
    func setThemePreferenceToBlue(){
        defaults.set("Blue", forKey: themePreferenceKey)
    }
    
    var themePerference: String? {
        get {
            return UserDefaults.standard.string(forKey: themePreferenceKey)
        }
    }
    
    
    
}
