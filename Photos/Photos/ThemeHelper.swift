//
//  ThemeHelper.swift
//  Photos
//
//  Created by Victor  on 5/2/19.
//  Copyright © 2019 com.Victor. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    let themePreferenceKey = ""
    
    init() {
        if themePreference != nil {
            setThemePreferenceToDark()
        }
    }
    
    var themePreference: String? {
        var result = ""
        return result
    }
    
    func setThemePreferenceToDark() {
        
        let userDefaults = UserDefaults.standard
        //userDefaults.set(<#T##url: URL?##URL?#>, forKey: <#T##String#>)
    }
    
    func setThemePreferenceToYourColorHere() {
        //set preference to any other color
    }
    
    
}
