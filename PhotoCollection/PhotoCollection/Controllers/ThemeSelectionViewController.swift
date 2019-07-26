//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Jeffrey Santana on 7/25/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

protocol ThemeSelectionViewControllerDelegate: AnyObject {
	func themeUpdated()
}

class ThemeSelectionViewController: UIViewController {
	
	@IBOutlet weak var themeColorLabel: UILabel!
	
	var themeHelper: ThemeHelper?
	weak var delegate: ThemeSelectionViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        themeColorLabel.text = themeHelper?.themePreference ?? "Select a theme"
		setTheme()
    }

	@IBAction func darkMode(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
		delegate?.themeUpdated()
	}
	
	@IBAction func blueMode(_ sender: Any) {
        themeHelper?.setThemePreferenceToYourColorHere()
		delegate?.themeUpdated()
	}
	
	func setTheme() {
		guard let themePreference = themeHelper?.themePreference else { return }
		delegate?.themeUpdated()
		view.backgroundColor = UIColor(named: themePreference)
	}
}
