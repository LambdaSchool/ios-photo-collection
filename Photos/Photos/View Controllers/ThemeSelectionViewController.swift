//
//  ThemeSelectionViewController.swift
//  Photos
//
//  Created by Breena Greek on 2/20/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    // MARK Properties
    var themeHelper: ThemeHelper?
    
    // IBActions
    @IBAction func selectDarkTheme(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func selectPurpleTheme(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToPurple()
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
