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
        pickerData = ["Blue", "Dark", "Green", "Indigo", "Orange", "Red"]
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
        print(themePicked)
        switch themePicked {
        case "Blue":
            themeHelper?.setThemePreferenceToBlue()
        case "Dark":
            themeHelper?.setThemePreferenceToDark()
        case "Green":
            themeHelper?.setThemePreferenceToGreen()
        case "Indigo":
            themeHelper?.setThemePreferenceToIndigo()
        case "Orange":
            themeHelper?.setThemePreferenceToOrange()
        case "Red":
            themeHelper?.setThemePreferenceToRed()
        default:
            break
        }
        choseTheme()
    }

    @IBAction func darkThemeButtonTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        delegate?.themeChosen()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func greenThemeButtonTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToGreen()
        delegate?.themeChosen()
        dismiss(animated: true, completion: nil)
    }
    
    func setTheme() {
        let theme = themeHelper?.themePrefer
        print("In PhotosCollectionView")
        switch theme {
        case "Blue":
            print("Blue")
         view.backgroundColor = .blue
        case "Dark":
            view.backgroundColor = .darkGray
        case "Green":
            view.backgroundColor = .green
        case "Indigo":
            print("cyan")
         view.backgroundColor = .cyan
        case "Orange":
            print("orange")
         view.backgroundColor = .orange
        case "Red":
            print("red")
         view.backgroundColor = .red
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
