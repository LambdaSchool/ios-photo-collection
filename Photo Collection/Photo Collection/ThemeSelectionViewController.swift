//
//  ThemeSelectionViewController.swift
//  Photo Collection
//
//  Created by Mitchell Budge on 5/9/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    var themeHelper: ThemeHelper?
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func greenThemePressed(_ sender: Any) {
        themeHelper?.setThemePreferenceToGreen()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func darkThemePressed(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }

}
