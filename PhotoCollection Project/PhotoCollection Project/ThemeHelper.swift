//
//  ThemeHelper.swift
//  PhotoCollection Project
//
//  Created by Michael Flowers on 1/16/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation

class ThemeHelper {
    var themePrefferenceKey = "ThemePreference" //use this for userDefaults
    
    //create a computed property. This should simply return the string value that you stored from either of the two methods you wrote below.
    var themePreference: String? {
        let didChoosePreference = UserDefaults.standard.string(forKey: themePrefferenceKey)
        return didChoosePreference //this should return an optional string value because if the user's them preference hasn't been saved yet, the value returned from UserDefaults will be NIL
    }
    
    
    //in the initializer (you will have to call it/implement), check if the themePreference value is nil. if it is, then call one of the setThemPreference functions you just created. This will make it so the first time the user opens the app a preference will be set for them until they choose to change it.
    
    init(){
        
        if themePreference == nil {
            //there is no value so I set the color myself
            print("equal nil")
            setThemePreferenceToLight()
        } 
    }
    
    func setThemePreferenceToDark(){
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePrefferenceKey)
    }
    
    func setThemePreferenceToLight(){
        let userDefaults = UserDefaults.standard
        userDefaults.set("Light", forKey: themePrefferenceKey)
    }
}
