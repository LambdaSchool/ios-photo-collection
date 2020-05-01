//
//  ThemeSelectionViewController.swift
//  photoviewer
//
//  Created by Ian French on 4/30/20.
//  Copyright © 2020 Ian French. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    
    @IBAction func darkTapped(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func greenTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToGreen()
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    var themeHelper: ThemeHelper?
    
    
    
    
    
    
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
