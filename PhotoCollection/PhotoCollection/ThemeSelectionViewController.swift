//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Ryan Murphy on 5/9/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    var themeHelper: ThemeHelper?
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
    @IBOutlet weak var selectDarkTheme: UIStackView!
    
    
    @IBAction func selectDarkThemePressed(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    @IBAction func selectBlueTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
}
