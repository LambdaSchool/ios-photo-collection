//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Dojo on 6/13/20.
//  Copyright © 2020 Dojo. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    // MARK: - Properties
    var themeHelper: ThemeHelper?
    var delegate: ThemeSelectionDelegate?
    
    
    // MARK: - IBActions
    @IBAction func selectDarkTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        delegate?.didSetTheme()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectLightTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToLight()
        delegate?.didSetTheme()
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
