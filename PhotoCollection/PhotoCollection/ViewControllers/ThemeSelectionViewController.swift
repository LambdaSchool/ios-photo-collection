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
            themeHelper?.setThemePreferenceToDark()
        default:
            themeHelper?.setThemePreferenceToIndigo()
        }
        
        setTheme()
    }
    
    //MARK: - IBActions
    
    @IBAction func doneTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    //MARK: - Private
    
    private func setTheme() {
        guard let themeHelper = themeHelper else { return }
        
        switch themeHelper.themePreference {
        case ThemeHelper.indigoTheme:
            view.backgroundColor = .systemIndigo
        default:
            view.backgroundColor = .darkGray
        }
    }
    
    private func updateThemeSelector() {
        guard let themeHelper = themeHelper else { return }
        
        switch themeHelper.themePreference {
        case ThemeHelper.indigoTheme:
            themeSelector.selectedSegmentIndex = 1
        default:
            themeSelector.selectedSegmentIndex = 0
        }
    }
    
    
    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        updateThemeSelector()
    }

}
