//
//  ThemeHelper.swift
//  ios-photo-collection
//
//  Created by Taylor Lyles on 5/2/19.
//  Copyright © 2019 Taylor Lyles. All rights reserved.
//

import UIKit

extension String {
	static let themePreferenceKey = "themePreferenceKey"
}

class ThemeHelper {
    
	var themePreference: String?
	
	let defaults = UserDefaults.standard
    
    func setThemePreferenceToDark() {
		defaults.set("Dark", forKey: .themePreferenceKey)
    }

    func setThemePreferenceToYourColorHere() {
        
    }
    
   
    
}
