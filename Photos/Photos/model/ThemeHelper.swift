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

	init() {
		guard let theme = themePreference else { return }
		if theme == "Dark" {
			setThemePreferenceDark()
		} else {
			setThemePreferenceRaspberry()
		}
	}

	var themePreference: String? {
		let defaults = UserDefaults.standard
		let color = defaults.string(forKey: ThemeHelper.themePreferenceKey)
		return color
	}


	func setThemePreferenceDark() {
		let defaults = UserDefaults.standard
		defaults.set("Dark", forKey: ThemeHelper.themePreferenceKey)
	}

	func setThemePreferenceRaspberry() {
		let defaults = UserDefaults.standard
		defaults.set("Raspberry Red", forKey: ThemeHelper.themePreferenceKey)
	}


}
