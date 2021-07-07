//
//  ThemeSelectionViewController.swift
//  Photo Collection
//
//  Created by Angel Buenrostro on 1/16/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func selectDarkTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        view.backgroundColor = .darkGray
        dismiss(animated: true, completion: nil)
    }
    @IBAction func selectYourColorHereTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToYourColorHere()
        view.backgroundColor = .cyan
        dismiss(animated: true, completion: nil)
    }
    

    // MARK: - Navigation
/*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let collectionVC = segue.destination as! PhotosCollectionViewController
        collectionVC.themeHelper.themePreference = themeHelper?.themePreference
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
 */

}
