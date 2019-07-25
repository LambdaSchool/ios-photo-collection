//
//  ThemeSelectionViewController.swift
//  Photos
//
//  Created by brian vilchez on 7/25/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper? 
    
    @IBOutlet weak var doneButton: UIButton!
	@IBOutlet weak var swipInstructionLabel: UILabel!
	@IBOutlet weak var titleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func rightGestureSwipe(_ sender: UISwipeGestureRecognizer) {
		guard let themeHelper = themeHelper else { return }
		themeHelper.setThemePreferenceRaspberry()
		view.backgroundColor = Colors.raspberryRed
		view.backgroundColor = Colors.raspberryRed
		titleLabel.textColor = Colors.redBGText
		swipInstructionLabel.textColor = Colors.redBGText
		doneButton.tintColor = Colors.redBGText
		doneButton.layer.borderWidth = 2
		doneButton.layer.borderColor = Colors.redBGAccent.cgColor
		doneButton.layer.cornerRadius = 8
    }
    @IBAction func leftGestureSwipe(_ sender: UISwipeGestureRecognizer) {
		guard let themeHelper = themeHelper else { return }
		themeHelper.setThemePreferenceRaspberry()
		view.backgroundColor = Colors.dark
		titleLabel.textColor = Colors.darkBGText
		swipInstructionLabel.textColor = Colors.darkBGText
		doneButton.tintColor = Colors.darkBGText
		doneButton.layer.borderWidth = 2
		doneButton.layer.borderColor = Colors.darkBGAccent.cgColor
		doneButton.layer.cornerRadius = 8
    }
    @IBAction func doneTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
