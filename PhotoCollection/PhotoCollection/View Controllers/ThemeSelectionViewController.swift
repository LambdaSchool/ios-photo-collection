//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Nathanael Youngren on 1/16/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
    }

    @IBAction func selectDarkTheme(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectYellowTheme(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToYellow()
        dismiss(animated: true, completion: nil)
    }
    
    func setTheme() {
        guard let currentTheme = themeHelper?.themePreference else { return }
        
        if currentTheme == "Dark" {
            view.backgroundColor = .gray
        } else if currentTheme == "Yellow" {
            view.backgroundColor = .yellow
        }
    }
    
    var themeHelper: ThemeHelper?

}
