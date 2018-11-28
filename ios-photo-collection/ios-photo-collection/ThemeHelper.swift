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
    
    let themePreferenceKey: String
    var themePreference: String?
    
    func setThemePerferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    
    // TODO: Test this color to make sure it works
    func setThemePreferenceToBlue(){
        UserDefaults.standard.set("Blue", forKey: themePreferenceKey)
    }
    
    var themePerference: String? {
        get {
            return UserDefaults.standard.string(forKey: themePreferenceKey)
        }
    }
    
    init (){
        
        if themePreference == nil {
            self.setThemePerferenceToDark()
        }
    }
    
}
