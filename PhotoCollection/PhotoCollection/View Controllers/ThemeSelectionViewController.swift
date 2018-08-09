//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Lisa Sampson on 8/9/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
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
    
    @IBAction func selectPurpleTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToPurple()
        dismiss(animated: true, completion: nil)
    }
    
    var themeHelper: ThemeHelper?

}
