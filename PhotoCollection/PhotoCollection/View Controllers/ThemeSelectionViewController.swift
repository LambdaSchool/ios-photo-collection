//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by David Wright on 12/12/19.
//  Copyright © 2019 David Wright. All rights reserved.
//

import UIKit

protocol themeSelectionDelegate {
    func themeWasSelected()
}

class ThemeSelectionViewController: UIViewController {

    // MARK: Properties
    
    var themeHelper: ThemeHelper?
    var delegate: themeSelectionDelegate?
    
    // MARK: IBActions
    
    @IBAction func selectLightTheme(_ sender: UIButton) {
        guard let themeHelper = themeHelper else { return }
        themeHelper.setThemePreferenceToLight()
        delegate?.themeWasSelected()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectDarkTheme(_ sender: UIButton) {
        guard let themeHelper = themeHelper else { return }
        themeHelper.setThemePreferenceToDark()
        delegate?.themeWasSelected()
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let themeHelper = themeHelper else { return }
        view.backgroundColor = themeHelper.themeColor
    }
}
