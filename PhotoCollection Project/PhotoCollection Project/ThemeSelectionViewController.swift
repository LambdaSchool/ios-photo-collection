//
//  ThemeSelectionViewController.swift
//  PhotoCollection Project
//
//  Created by Michael Flowers on 1/16/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func selectDarkThem(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToDark()
        view.backgroundColor = .brown
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectLightTheme(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToLight()
        view.backgroundColor = .cyan
        dismiss(animated: true, completion: nil)
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
