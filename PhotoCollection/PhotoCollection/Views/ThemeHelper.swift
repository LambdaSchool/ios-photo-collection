//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Kelson Hartle on 4/23/20.
//  Copyright © 2020 Kelson Hartle. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    //MARK: - Properties
    var themePreference : String? {
        
        return UserDefaults.standard.string(forKey: themePrefrenceKey)
    }
    
    let themePrefrenceKey: String = "themePrefrenceKey"
    
    // MARK: - Life Cycle
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    //MARK: - Functions
    func setThemePreferenceToDark() {
        

        UserDefaults.standard.set("Dark", forKey: themePrefrenceKey)
        
    }
    
    func setThmePrefernceToYourColorHere() {
        
        UserDefaults.standard.set("Blue", forKey: themePrefrenceKey)
        
    }
    
    
}
