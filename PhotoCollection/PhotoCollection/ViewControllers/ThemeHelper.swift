//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Chris Price on 12/12/19.
//  Copyright © 2019 Chris Price. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey: String
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        UserDefaults.standard.set("Blue", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        if // one case for dark, one case for blue, default case set to the dark result.
        //This way dark will be the default, but it can also be selected if Blue had previously been selected.
    }
}
