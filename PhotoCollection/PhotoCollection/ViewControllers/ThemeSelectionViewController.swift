//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Shawn Gee on 2/27/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    //MARK: - Properties
    
    var themeHelper: ThemeHelper?
    
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var themeSelector: UISegmentedControl!
    
    @IBAction func themeSelected(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            themeHelper?.setThemePreferenceToIndigo()
        default:
            themeHelper?.setThemePreferenceToDark()
        }
    }
    
    
    //MARK: - IBActions
    
    @IBAction func doneTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
