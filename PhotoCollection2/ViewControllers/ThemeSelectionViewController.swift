//
//  ThemeSelectionViewController.swift
//  PhotoCollection2
//
//  Created by brian vilchez on 8/22/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

// testing

import UIKit

class ThemeSelectionViewController: UIViewController {

	var themeHelper: ThemeHelper?



  

    
	@IBAction func blueButtonPressed(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToAnotherColor()
	}

	@IBAction func darkButtonPressed(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)

        
	}
	

}
