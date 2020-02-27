//
//  ViewController.swift
//  PhotoCollection
//
//  Created by Jordan Christensen on 8/23/19.
//  Copyright © 2019 Mazjap Co Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var themeHelper = ThemeHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        themeHelper.setThemePreferenceToBlue()
    }
}

