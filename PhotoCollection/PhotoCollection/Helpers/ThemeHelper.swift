//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by admin on 7/25/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class ThemeHelper {
	let themePreferenceKey = "ThemePreference"
	
	let userDefaults = UserDefaults.standard
	
	var themePreference: String? {
		print(userDefaults.string(forKey: themePreferenceKey))
		return userDefaults.string(forKey: themePreferenceKey)
	}
	
	init() {
		if themePreference == nil {
			setThemePreferenceToDark()
		}
	}
	
	func setThemePreferenceToDark() {
		UserDefaults.standard.setValue("dark", forKey: themePreferenceKey)
	}
	
	func setThemePreferenceToYourColorHere() {
		UserDefaults.standard.setValue("blue", forKey: themePreferenceKey)
	}
	
    
}
