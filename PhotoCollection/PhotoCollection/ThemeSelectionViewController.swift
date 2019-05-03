//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by morse on 5/2/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectPurpleThemeButtonTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToPurple()
        dismiss(animated: true, completion: nil )
    }
    
    @IBAction func selectDarkThemeButtonTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil )
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
