//
//  ThemeSelectionViewController.swift
//  Photo Collection
//
//  Created by Jon Bash on 2019-10-17.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?
    var delegate: PhotosCollectionViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        themeHelper?.setTheme(for: view)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func selectBlueTheme(_ sender: UIButton) {
        selectTheme(.blue)
    }
    
    @IBAction func selectDarkTheme(_ sender: UIButton) {
        selectTheme(.dark)
    }
    
    private func selectTheme(_ preference: ThemePreference) {
        themeHelper?.setTheme(to: preference)
        themeHelper?.setTheme(for: view)
        if let collectionView = delegate?.collectionView {
            themeHelper?.setTheme(for: collectionView)
        }
        dismiss(animated: true, completion: nil)
    }
}
