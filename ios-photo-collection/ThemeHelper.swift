//
//  ThemeHelper.swift
//  ios-photo-collection
//
//  Created by Taylor Lyles on 5/2/19.
//  Copyright © 2019 Taylor Lyles. All rights reserved.
//

import UIKit


class ThemeHelper {
	
	init() {
		guard themePreference == nil else { return }
		setThemePreferenceToDark()
	}
    
    var themePreference: String? {
		return defaults.string(forKey: .themePreferenceKey)
    }
    
	let defaults = UserDefaults.standard
    
    func setThemePreferenceToDark() {
		defaults.set("Dark", forKey: .themePreferenceKey)
    }

    func setThemePreferenceToNeonPink() {
        defaults.set("Neon Pink", forKey: .themePreferenceKey)
    }
    
   
    
}
