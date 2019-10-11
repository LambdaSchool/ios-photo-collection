//
//  ThemeSelectionViewController.swift
//  Photo Collection
//
//  Created by Joseph Rogers on 10/10/19.
//  Copyright © 2019 Joe Rogers. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    //MARK: Properties
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func darkButtonPressed(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func blueButtonPressed(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToBlue()
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
