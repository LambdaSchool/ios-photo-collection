//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Shawn James on 3/26/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    // MARK: - Properties
    var themeHelper: ThemeHelper?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Actions
    @IBAction func redTheme(_ sender: Any) {
        themeHelper?.setThemeToRed()
        dismiss(animated: true, completion: nil)
    }
    @IBAction func blueTheme(_ sender: Any) {
        themeHelper?.setThemeToBlue()
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Methods
    
    func setTheme() {
        guard let theme = themeHelper?.themePreference else { return }
        if theme == String.redTheme { view.backgroundColor = .red } else { view.backgroundColor = .blue }
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
