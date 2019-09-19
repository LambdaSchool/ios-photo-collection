//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by macbook on 9/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


class ThemeHelper {
    
    let themePreferenceKey: String = "themePreference"     // Not sure if it should be initialized as an optional or an empty string
    
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    
    
    func setThemePreferenceToDark() {
        
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToGreen() {
        
        let userDefaults = UserDefaults.standard
        userDefaults.set("Green", forKey: themePreferenceKey)
    }
    
    
    
    
    
    
    
    
}



//  TODO: - Part 2, step 4 and 5   of intructions
//
//Finally, create a computed property called themePreference of type String?. This should simply return the string value that you stored from either of the two methods you wrote above. Use the UserDefaults string(forKey: ...) method to get that value. The method should return an optional string because if the user's theme preference hasn't been saved, the value returned from UserDefaults will be nil.
//In the initializer for this class (you will have to call it), check if the themePreference value is nil. If it is, then call one of the setThemePreference functions you just created. This will make it so the first time the user opens the app a preference will be set for them until they choose to change it.
//
//Keep in mind that the implementation of this class is not the absolute best. You haven't been introduced to a few concepts that would facilitate and keep this class a bit cleaner, especially if this were to be expanded into a full theme helper class for an actual application. Don't worry though, we'll get there!
