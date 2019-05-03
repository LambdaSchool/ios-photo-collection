//
//  ThemeSelectionViewController.swift
//  Photos
//
//  Created by Anesa Krnic on 5/2/19.
//  Copyright © 2019 com.Victor. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var darkButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //sets theme 
    @IBAction func darkButtonPressed(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }

    @IBAction func blueButtonPressed(_ sender: Any) {
        themeHelper?.setThemePreferenceToYourColorHere()
        dismiss(animated: true, completion: nil)
    }
}
