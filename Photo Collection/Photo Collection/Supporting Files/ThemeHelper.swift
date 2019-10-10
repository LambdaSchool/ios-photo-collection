//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Joseph Rogers on 10/8/19.
//  Copyright © 2019 Joe Rogers. All rights reserved.
//

import Foundation
    //MARK: Settings
class ThemeHelper{
    
  // MARK: - Init Method
  
  init() {
      if themePreference == nil {
          setThemePreferenceToBlue()
      }
  }
    
    //MARK: Properties
    static var themePreferenceKey = "themePreferenceKey"
    
    //here we created a theme preference. it changes the value for the key we have specified. (its a dictionary correct?)
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: ThemeHelper.themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        UserDefaults.standard.set("Blue", forKey: ThemeHelper.themePreferenceKey)
    }
    
    var themePreference: String? {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: ThemeHelper.themePreferenceKey)
    }

}
