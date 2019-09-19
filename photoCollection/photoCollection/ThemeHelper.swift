//
//  ThemeHelper.swift
//  photoCollection
//
//  Created by Jonalynn Masters on 9/19/19.
//  Copyright © 2019 Jonalynn Masters. All rights reserved.
//

import Foundation

extension String {
    static var themePreferenceKey = "ThemePreferenceKey" }

    class ThemeHelper {
    
        //MARK: Methods
// use the set methods of user defaults set the value as type string and preference key you created above as the key
    func setThemePreferenceToDark() {
        let setThemePreferenceToDark = UserDefaults.standard.set("Dark", forKey: .themePreferenceKey)
        }
        
    func setThemePreferenceToLight() {
        let setThemePreferenceToLight = UserDefaults.standard.set("Light", forKey: .themePreferenceKey)
        }
        
        var themePreference: (String?) -> String {
            
        }
}
