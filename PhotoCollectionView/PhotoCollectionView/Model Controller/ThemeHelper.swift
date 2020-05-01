//
//  ThemeHelper.swift
//  PhotoCollectionView
//
//  Created by Clayton Watkins on 4/29/20.
//  Copyright © 2020 Clayton Watkins. All rights reserved.
//

import Foundation

class ThemeHelper{
    
    //MARK: - Properties
    var themePreferenceKey: String = "ThemePreferenceKey"
    
    var themePreference: String? {
        if let themePreference = UserDefaults.standard.string(forKey: themePreferenceKey){
            return themePreference
        } else{
            return nil
        }
    }
    
    //MARK: - LifeCycle
    
    init(){
        if themePreference == nil{
            setThemePreferenceToDark()
        }
    }
    
    //MARK: - Helper Functions
    func setThemePreferenceToDark(){
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYourColorHere(){
        UserDefaults.standard.set("Blue", forKey: themePreferenceKey)
    }
    
}
