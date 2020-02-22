//
//  ThemeSelectionViewController.swift
//  PhotoIOSPT5
//
//  Created by David Williams on 2/19/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

protocol ThemeSelectedDelegate {
    func themeChosen()
}

class ThemeSelectionViewController: UIViewController {

    var themeHelper: ThemeHelper?
    var delegate: ThemeSelectedDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func darkThemeButtonTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        delegate?.themeChosen()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func greenThemeButtonTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToGreen()
        delegate?.themeChosen()
        dismiss(animated: true, completion: nil)
    }
}
