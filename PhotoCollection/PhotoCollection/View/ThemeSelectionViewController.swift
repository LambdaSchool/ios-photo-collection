//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Shawn James on 2/27/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    // MARK: - Properties
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction func redTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToRed()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func blueTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToBlue()
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
    
    func setTheme() {
        guard let themeHelper = themeHelper else { return }
        switch themeHelper.themePreference {
        case ThemeHelper.redTheme:
            view.backgroundColor = .red
        default:
            view.backgroundColor = .blue
        }
    }

}
