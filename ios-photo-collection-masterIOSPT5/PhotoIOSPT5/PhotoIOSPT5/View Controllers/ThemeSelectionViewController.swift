//
//  ThemeSelectionViewController.swift
//  PhotoIOSPT5
//
//  Created by David Williams on 2/19/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    var themeHelper: ThemeHelper?
   
    override func viewDidLoad() {
        super.viewDidLoad()
updateViews()
        // Do any additional setup after loading the view.
    }
    

    func updateViews() {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func darkThemeButtonTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        updateViews()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func greenThemeButtonTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToGreen()
        updateViews()
        dismiss(animated: true, completion: nil)
    }
}
