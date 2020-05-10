//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Joel Groomer on 8/15/19.
//  Copyright © 2019 Julltron. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func darkTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func blueTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
}
