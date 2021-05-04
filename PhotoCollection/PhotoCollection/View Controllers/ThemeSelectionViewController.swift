//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by David Wright on 12/12/19.
//  Copyright © 2019 David Wright. All rights reserved.
//

import UIKit

protocol ThemeSelectionDelegate: AnyObject {
    func themeWasSelected()
}

class ThemeSelectionViewController: UIViewController {

    // MARK: Properties
    
    var themeHelper: ThemeHelper?
    weak var delegate: ThemeSelectionDelegate?
    
    // MARK: IBActions
    
    @IBAction func selectLightTheme(_ sender: UIButton) {
        selectTheme(.light)
    }
    
    @IBAction func selectDarkTheme(_ sender: UIButton) {
        selectTheme(.dark)
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTheme()
    }
    
    // MARK: - Private Methods
    
    private func selectTheme(_ theme: ThemeHelper.Theme) {
        defer { dismiss(animated: true, completion: nil) }
        
        guard let themeHelper = themeHelper, themeHelper.theme != theme else { return }
        
        themeHelper.theme = theme
        
        setTheme()
        delegate?.themeWasSelected()
    }
    
    private func setTheme() {
        guard let themeHelper = themeHelper else { return }
        view.backgroundColor = themeHelper.backgroundColor
    }
}
