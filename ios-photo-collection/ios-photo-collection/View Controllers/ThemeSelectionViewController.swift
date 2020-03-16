//
//  ThemeSelectionViewController.swift
//  ios-photo-collection
//
//  Created by Matthew Martindale on 2/19/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

protocol preferenceDelegate {
    func themePreferred(colorString: String)
}

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?
    var delegate: preferenceDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func selectDarkTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        guard let darkTheme = themeHelper?.themePreference else { return }
        delegate?.themePreferred(colorString: darkTheme)
        view.backgroundColor = #colorLiteral(red: 0.1764146984, green: 0.1993693411, blue: 0.2962295413, alpha: 1)
    }
    
    @IBAction func SelectGoldTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToGold()
        guard let goldTheme = themeHelper?.themePreference else { return }
        delegate?.themePreferred(colorString: goldTheme)
        view.backgroundColor = #colorLiteral(red: 1, green: 0.8357229829, blue: 0, alpha: 1)
    }
}
