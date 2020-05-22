//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Richard Gibbs on 5/21/20.
//  Copyright © 2020 Rich Gibbs. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    
    var themeHelper: ThemeHelper?
    @IBOutlet weak var selectThemeLabel: UILabel!
    @IBAction func selectDarkTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    @IBAction func selectRedTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToRed()
        dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   

}
