//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Alex Ladines on 5/2/19.
//  Copyright © 2019 Alex Perse. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    // MARK: - Properties
    var themeHelper: ThemeHelper?
    
    // MARK: - IBAction
    @IBAction func selectDarkTheme(_ sender: Any) {
        guard let themeHelper = self.themeHelper else { return }
        themeHelper.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectBlueTheme(_ sender: Any) {
        guard let themeHelper = self.themeHelper else { return }
        themeHelper.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    

    
}
