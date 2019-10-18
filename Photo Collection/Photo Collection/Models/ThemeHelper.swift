//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Rick Wolter on 10/17/19.
//  Copyright © 2019 Richar Wolter. All rights reserved.
//

import Foundation
import UIKit
class ThemeHelper{
    
    let themePreferenceKey: String = "themePreferenceKey"
    
    var themePreference: String? {
        
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    init(themePreference: String?) {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    func setThemePreferenceToDark(){
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    func setThemePreferenceToYourColorHere(){
        UserDefaults.standard.set("Darcula", forKey: themePreferenceKey)
    }
    
    
    
    
    
    
}
