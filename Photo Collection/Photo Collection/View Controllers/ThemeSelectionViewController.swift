//
//  ThemeSelectionViewController.swift
//  Photo Collection
//
//  Created by Cody Morley on 8/3/20.
//  Copyright © 2020 Cody Morley. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    //MARK: - Properties -
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
    }
    
    
    //MARK: - Actions -
    @IBAction func selectLambdaTheme(_ sender: Any) {
        guard let themeHelper = themeHelper else { return }
        themeHelper.setThemePreferenceToLambda()
        self.dismiss(animated: true,
                     completion: nil)
    }
    
    @IBAction func selectDarkTheme(_ sender: Any) {
        guard let themeHelper = themeHelper else { return }
        themeHelper.setThemePreferenceToDark()
        self.dismiss(animated: true,
                     completion: nil)
    }
    
    
    //MARK: - Methods -
    private func setTheme() {
        guard let themeHelper = themeHelper, let themePreference = themeHelper.themePreference else { return }
        
        switch themePreference {
        case themeHelper.darkValue:
            self.view.backgroundColor = UIColor.black
        case themeHelper.lambdaValue:
            self.view.backgroundColor = UIColor.white
        default:
            print("No theme data for collection view.")
        }
    }
}
