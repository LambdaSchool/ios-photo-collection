//
//  ThemeSelectionViewController.swift
//  PhotoIOSPT5
//
//  Created by David Williams on 2/19/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

protocol ThemeSelectedDelegate {
    func themeChosen()
}

class ThemeSelectionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    @IBOutlet weak var themePicker: UIPickerView!
    
    var themeHelper: ThemeHelper?
    var delegate: ThemeSelectedDelegate?
    
    var pickerData: [String] = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.themePicker.delegate = self
        self.themePicker.dataSource = self
        themePicker.delegate = self
        pickerData = ["Blue", "Brown", "Dark", "Gray", "Green", "Indigo", "Light", "Orange", "Purple","Red", "Teal", "Yellow"]
        // Do any additional setup after loading the view.
        setTheme()
    }
    func updateViews() {
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           1
       }
       
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerData.count
       }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let themePicked = pickerData[themePicker.selectedRow(inComponent: 0)]
        switch themePicked {
        case "Blue":
            themeHelper?.setThemePreferenceToBlue()
        case "Brown":
            themeHelper?.setThemePreferenceToBrown()
        case "Dark":
            themeHelper?.setThemePreferenceToDark()
        case "Green":
            themeHelper?.setThemePreferenceToGreen()
        case "Gray":
            themeHelper?.setThemePreferenceToGray()
        case "Indigo":
            themeHelper?.setThemePreferenceToIndigo()
        case "Light":
            themeHelper?.setThemePreferenceToLightGray()
        case "Orange":
            themeHelper?.setThemePreferenceToOrange()
        case "Purple":
            themeHelper?.setThemePreferenceToPurple()
        case "Red":
            themeHelper?.setThemePreferenceToRed()
        case "Teal":
            themeHelper?.setThemePreferenceToTeal()
        case "Yellow":
            themeHelper?.setThemePreferenceToYellow()
        default:
            break
        }
        choseTheme()
    }
    
    func setTheme() {
        let theme = themeHelper?.themePreference
        switch theme {
        case "Blue":
            view.backgroundColor = .systemBlue
        case "Brown":
            view.backgroundColor = .brown
        case "Dark":
            view.backgroundColor = .darkGray
        case "Green":
            view.backgroundColor = .systemGreen
        case "Gray":
            view.backgroundColor = .systemGray
        case "Indigo":
            view.backgroundColor = .systemIndigo
        case "Light":
            view.backgroundColor = .lightGray
        case "Orange":
            view.backgroundColor = .systemOrange
        case "Purple":
            view.backgroundColor = .systemPurple
        case "Red":
            view.backgroundColor = .systemRed
        case "Teal":
            view.backgroundColor = .systemTeal
        case "Yellow":
            view.backgroundColor = .systemYellow
        default:
            break
        }
    }
    
    func choseTheme() {
        delegate?.themeChosen()
        dismiss(animated: true, completion: nil)
    }
}

extension ThemeSelectionViewController: ThemeSelectedDelegate {
    func themeChosen() {
        setTheme()
    }
}
