//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Kobe McKee on 5/9/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    var themeHelper: ThemeHelper?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    @IBAction func blueThemePressed(_ sender: Any) {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func darkThemePressed(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
}
