//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Stuart on 1/16/19.
//  Copyright © 2019 Stuart. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func selectDarkTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectCyanTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToCyan()
        dismiss(animated: true, completion: nil)
    }
    
    var themeHelper: ThemeHelper?
}
