//
//  ThemeSelectionViewController.swift
//  iOS Photo Collection
//
//  Created by Jake Connerly on 7/25/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    //
    //MARK: - IBOutlets and Properties
    //
    
    var themeHelper: ThemeHelper?
    
    //
    //MARK: - View LifeCycle
    //

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //
    //MARK: - IBActions and Methods
    //
    
    @IBAction func selectDarkTheme(_ sender: UIButton) {
    }
    @IBAction func selectYourColorHereTheme(_ sender: UIButton) {
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
