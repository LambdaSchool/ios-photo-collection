//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Lisa Sampson on 8/9/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectDarkTheme(_ sender: Any) {
        
    }
    
    @IBAction func selectPurpleTheme(_ sender: Any) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    var themeHelper: ThemeHelper?

}
