//
//  ThemeSelectionViewController.swift
//  Photo Collection
//
//  Created by Cameron Dunn on 1/16/19.
//  Copyright © 2019 Cameron Dunn. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    var themeHelper: ThemeHelper?
    @IBOutlet weak var lightThemeIndicator: UIView!
    @IBOutlet weak var darkThemeIndicator: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        setTheme()
    }
    @IBAction func done(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func selectLightTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToLight()
        setTheme()
    }
    @IBAction func selectDarkTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        setTheme()
    }
    func setTheme(){
        guard let theme = themeHelper!.themePreference else {return}
        if(theme == .dark){
            self.view.backgroundColor = UIColor.darkGray
            darkThemeIndicator.isHidden = false
            lightThemeIndicator.isHidden = true
        }else if(theme == .light){
            self.view.backgroundColor = UIColor.white
            darkThemeIndicator.isHidden = true
            lightThemeIndicator.isHidden = false
        }
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
