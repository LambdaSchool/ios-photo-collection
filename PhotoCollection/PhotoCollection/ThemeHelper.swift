//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Lambda_School_Loaner_241 on 2/20/20.
//  Copyright © 2020 Lambda_School_Loaner_241. All rights reserved.
//

import Foundation


class ThemeHelper {
    let themePreferenceKey: String
    
    func setThemePreferenceToDark(){
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYourColorHere() {
        UserDefaults.standard.set("Blue", forKey: themePreferenceKey)
    }
    
    
    // Computed Property
 /*   var themePreference: String? {
        func string(forKey defaultName: String) -> String? {
            return string()  // part 2 question 4

        }
        
    } */
    
    init(themePreferenceKey: String) {
        self.themePreferenceKey = themePreferenceKey
        
       // part 2 question 5 
        
        
        
    }
    
}
