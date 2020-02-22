//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Elizabeth Thomas on 2/20/20.
//  Copyright © 2020 Libby Thomas. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    // MARK: - IBActions
    @IBAction func darkThemeTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func greenThemeTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToGreen()
        dismiss(animated: true, completion: nil)
    }
}
