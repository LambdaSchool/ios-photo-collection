//
//  ThemeSelectionViewController.swift
//  Photo Collection
//
//  Created by Gladymir Philippe on 6/11/20.
//  Copyright © 2020 Gladymir Philippe. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    
    //var themeHelper: ThemeHelper?
    
    var themeHelper: ThemeHelper?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
    }
    
   // override func viewWillAppear(_ animated: Bool) {
   //     super.viewWillAppear(animated)
   //     themeHelper.setTheme(viewController: self)
     //setTheme()
  //  }
    
    
    @IBAction func selectDarkTheme(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectLightTheme(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToMagenta()
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
