//
//  ThemeSelectionViewController.swift
//  Photo Collection AP
//
//  Created by Jorge Alvarez on 12/19/19.
//  Copyright © 2019 Jorge Alvarez. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    
    @IBAction func selectDarkTheme(_ sender: UIButton) {
        print("\(#function)")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectYourColorHereTheme(_ sender: UIButton) {
        print("\(#function)")
        dismiss(animated: true, completion: nil)
    }
    
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

}
