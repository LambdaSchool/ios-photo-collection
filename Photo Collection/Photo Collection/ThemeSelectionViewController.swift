//
//  ThemeSelectionViewController.swift
//  Photo Collection
//
//  Created by Mark Gerrior on 2/27/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

import UIKit

protocol PresentModallyDelegate {
    func modalDismiss()
}

class ThemeSelectionViewController: UIViewController {

    var themeHelper: ThemeHelper?
    var delegate: PresentModallyDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func darkButton(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        delegate?.modalDismiss()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func blueButton(_ sender: Any) {
        themeHelper?.setThemePreferenceToBlue()
        delegate?.modalDismiss()
        dismiss(animated: true, completion: nil)
    }
}
