//
//  ThemeSelectionViewController.swift
//  Photos
//
//  Created by brian vilchez on 7/25/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper? 
    
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func rightGestureSwipe(_ sender: UISwipeGestureRecognizer) {
    }
    @IBAction func leftGestureSwipe(_ sender: UISwipeGestureRecognizer) {
    }
    @IBAction func doneTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
