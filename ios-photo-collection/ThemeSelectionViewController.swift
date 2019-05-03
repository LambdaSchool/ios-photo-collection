//
//  ThemeSelectionViewController.swift
//  ios-photo-collection
//
//  Created by Taylor Lyles on 5/2/19.
//  Copyright © 2019 Taylor Lyles. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
	
	var themeHelper : ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()

		
    }
    

	@IBAction func buttonSelectorValueChanged(_ sender: UISegmentedControl) {
		// Get selected index of the button
		// Dark is at index 0, Neon pink is at index 1
		// If the index is 0 we set the theme to dark, if index is 0 we set theme to neon pink
		// Dismiss current controller
		
		switch sender.selectedSegmentIndex {
		case 0:
			themeHelper?.setThemePreferenceToDark()
		case 1:
			themeHelper?.setThemePreferenceToNeonPink()
		default:
			break
		}
		dismiss(animated: true)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		if let currentTheme = themeHelper?.themePreference {
			if currentTheme == "Dark" {
				themeSelector.selectedSegmentIndex = 0
			} else {
				themeSelector.selectedSegmentIndex = 1
			}
		}
		
	}

	@IBOutlet weak var themeSelector: UISegmentedControl!
}
