//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Cameron Collins on 3/26/20.
//  Copyright © 2020 Cameron Collins. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Variables
    var themeHelper: ThemeHelper?

    @IBAction func selectDarkTheme(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectYourColorHereTheme(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToYourColorHere()
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
