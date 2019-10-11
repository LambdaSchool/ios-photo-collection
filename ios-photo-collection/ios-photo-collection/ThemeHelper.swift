//
//  ThemeHelper.swift
//  ios-photo-collection
//
//  Created by denis cedeno on 10/10/19.
//  Copyright © 2019 DenCedeno Co. All rights reserved.
//

import Foundation

class ThemeHelper{
    
    let themePreferenceKey: String = ""

    var themePreference: String? {
    return UserDefaults.standard.string(forKey: themePreferenceKey)
    }

    init(){
        if themePreference == nil{
            setThemePreferenceToDark() ////This will make it so the first time the user opens the app a preference will be set for them until they choose to change it.
        }
    }


    func setThemePreferenceToDark(){
    UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }

    func setThemePreferenceToColor(){
    UserDefaults.standard.set("Color", forKey: themePreferenceKey)
    }
}



////Keep in mind that the implementation of this class is not the absolute best. You haven't been introduced to a few concepts that would facilitate and keep this class a bit cleaner, especially if this were to be expanded into a full theme helper class for an actual application. Don't worry though, we'll get there!
