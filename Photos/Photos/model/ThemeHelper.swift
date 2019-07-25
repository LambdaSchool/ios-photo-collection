//
//  ThemeHelper.swift
//  Photos
//
//  Created by Marlon Raskin on 7/25/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import Foundation


class ThemeHelper {

	static let themePreferenceKey = "selectTheme"

//	var themePreference: String? {
//
//	}


	func setThemePreferenceDark() {
		let defaults = UserDefaults.standard
		defaults.set("Dark", forKey: ThemeHelper.themePreferenceKey)
	}

	func setThemePreferenceRaspberry() {
		let defaults = UserDefaults.standard
		defaults.set("Raspberry Red", forKey: ThemeHelper.themePreferenceKey)
	}


}
