//
//  ThemeSelectionViewController.swift
//  Photo Collection
//
//  Created by Mark Gerrior on 2/27/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

import UIKit

protocol fooDelegate {
    func somethingChanged()
}

class ThemeSelectionViewController: UIViewController {

    var themeHelper: ThemeHelper?
    var delegate: fooDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func darkButton(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        delegate?.somethingChanged()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func blueButton(_ sender: Any) {
        //FIXME: actually change the color!
        themeHelper?.setThemePreferenceToBlue()
        delegate?.somethingChanged()
        dismiss(animated: true, completion: nil)
    }
}
