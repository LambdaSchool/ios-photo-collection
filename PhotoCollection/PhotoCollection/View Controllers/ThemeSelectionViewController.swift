//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Gi Pyo Kim on 9/19/19.
//  Copyright © 2019 GIPGIP Studio. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    // MARK: - Properties
    var themeHelper: ThemeHelper?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setTheme()
    }

    @IBAction func selectDarkTheme(_ sender: Any) {
        guard let themeHelper = themeHelper else { return }
        
        themeHelper.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func selectRandomTheme(_ sender: Any) {
        guard let themeHelper = themeHelper else { return }
        
        themeHelper.randomColor = UIColor(hue: CGFloat(Double.random(in: 0...360))/CGFloat(360), saturation: 0.7, brightness: 0.7, alpha: 1)
        themeHelper.setThemePreferenceToRandom()
        dismiss(animated: true, completion: nil)
    }
    
    func setTheme() {
        guard let themeHelper = themeHelper, let themePreference = themeHelper.themePreference else { return }
        
        switch themePreference {
        case "Dark":
            view.backgroundColor = UIColor.gray
        case "Random":
            view.backgroundColor = themeHelper.randomColor
        default:
            print("Invalid themePreference")
            return
        }
    }
    
}
