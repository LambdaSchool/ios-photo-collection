//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Brian Rouse on 4/22/20.
//  Copyright © 2020 Brian Rouse. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?
    
    // MARK: - ViewLifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBActions
    
    @IBAction func darkThemeBtnDidTapped(_ sender: UIButton) {
        if let tHelper = self.themeHelper {
            tHelper.setThemePreferenceToDark()
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func blueThemeBtnDidTapped(_ sender: UIButton) {
        if let tHelper = self.themeHelper {
            tHelper.setThemePreferenceToBlue()
        }
        self.dismiss(animated: true, completion: nil)
    }
}
