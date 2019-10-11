//
//  ThemeSelectionViewController.swift
//  ios photo Collection
//
//  Created by Nicolas Rios on 8/16/19.
//  Copyright © 2019 Nicolas Rios. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

  
      
      var themeHelper: ThemeHelper?
      

      override func viewDidLoad() {
          super.viewDidLoad()

          // Do any additional setup after loading the view.
      }
      

      
    @IBAction func selectDarkThemeTapped(_ sender: Any) {
          themeHelper?.setThemePreferenceToDark()
          dismiss(animated: true, completion: nil)
      }
      
      @IBAction func selectLightThemeTapped(_ sender: Any) {
          themeHelper?.setThemePreferenceToLight()
          dismiss(animated: true, completion: nil)
      }
      
      
  }

