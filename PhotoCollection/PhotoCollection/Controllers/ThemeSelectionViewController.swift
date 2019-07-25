//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Jeffrey Santana on 7/25/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
	
	@IBOutlet weak var themeColorLabel: UILabel!
	
	var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()

        themeColorLabel.text = themeHelper?.themePreference ?? "Select a theme"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

	@IBAction func darkMode(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
	}
	
	@IBAction func blueMode(_ sender: Any) {
        themeHelper?.setThemePreferenceToYourColorHere()
        dismiss(animated: true, completion: nil)
	}
}
