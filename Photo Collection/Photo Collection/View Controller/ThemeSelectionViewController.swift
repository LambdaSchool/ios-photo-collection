//
//  ThemeSelectionViewController.swift
//  Photo Collection
//
//  Created by Alex Rhodes on 7/25/19.
//  Copyright © 2019 Blake Andrew Price. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        
    }
    
    @IBAction func darkButtonPressed(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func lightButtonPressed(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToYouColorHue()
        dismiss(animated: true, completion: nil)
    }
    
    func setTheme() {
        guard let themeChosen = themeHelper?.themePreference else {return}
        
        if themeChosen == "Dark" {
            view.backgroundColor = UIColor.darkGray
        } else {
            view.backgroundColor = UIColor.white
        }
    }
    
}
