//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Josh Kocsis on 4/30/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import UIKit
protocol ThemeDelegate {
    func themeUpdated()
}
class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?
    var delegate: ThemeDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func selectDarkTheme(_ sender: UIButton) {
        themeHelper?.setThemePreferenceDark()
        delegate?.themeUpdated()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectRedTheme(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToRed()
        delegate?.themeUpdated()
        dismiss(animated: true, completion: nil)
    }
}
