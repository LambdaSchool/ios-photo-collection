//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Ciara Beitel on 8/22/19.
//  Copyright © 2019 Joshua Sharp. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?
    
    
    @IBOutlet weak var themePicker: UIPickerView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveTapped(_ sender: Any) {
        let selected = themePicker.selectedRow(inComponent: 0)
        themeHelper?.setThemePreference(to: ThemeColor.allCases[selected])
        print (themeHelper?.themePreference ?? "")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
extension ThemeSelectionViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ThemeColor.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ThemeColor.allCases[row].rawValue
    }
}
