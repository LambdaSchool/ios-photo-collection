//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Stuart on 1/16/19.
//  Copyright © 2019 Stuart. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

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
    
    @IBAction func selectDarkTheme(_ sender: Any) {
    }
    
    @IBAction func selectLightBlueTheme(_ sender: Any) {
    }
    
    var themeHelper: ThemeHelper?
}
