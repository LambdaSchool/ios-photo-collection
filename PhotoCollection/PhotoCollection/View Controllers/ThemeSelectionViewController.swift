//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Jessie Ann Griffin on 8/15/19.
//  Copyright © 2019 Jessie Griffin. All rights reserved.
//

import UIKit

protocol ThemeSelectionDelegate {
    func themeWasSelected(_ theme: ThemeHelper)
}

class ThemeSelectionViewController: UIViewController {

    var themeHelper: ThemeHelper?
    
    var delegate: ThemeSelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func selectDarkTheme(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectYouColorHereTheme(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToYourColorHere()
        dismiss(animated: true, completion: nil)
    }
}
