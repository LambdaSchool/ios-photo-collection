//
//  ThemeSelectionViewController.swift
//  Photo Collection
//
//  Created by Kenny on 12/19/19.
//  Copyright © 2019 Hazy Studios. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    @IBAction func selectLightTheme(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectDarkTheme(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
}
