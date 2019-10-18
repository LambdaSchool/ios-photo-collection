//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Rick Wolter on 10/17/19.
//  Copyright © 2019 Richar Wolter. All rights reserved.
//

import Foundation
import UIKit
class ThemeHelper{
    
    let themePreferenceKey: String = "themePreferenceKey"
    
    
    
    //MARK: Properties
    
    //MARK:  4.
//    Finally, create a computed property called themePreference of type String?. This should simply return the string value that you stored from either of the two methods you wrote above. Use the UserDefaults string(forKey: ...) method to get that value. The method should return an optional string because if the user's theme preference hasn't been saved, the value returned from UserDefaults will be nil.
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    
    //MARK: 5.
//    In the initializer for this class (you will have to call it), check if the themePreference value is nil. If it is, then call one of the setThemePreference functions you just created. This will make it so the first time the user opens the app a preference will be set for them until they choose to change it.
    init(themePreference: String?) {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    
    
    //MARK: - 2 and 3
    //Create a function called setThemePreferenceToDark(). Using the set method of UserDefaults (remember that in order to access set, you have to use the standard property on UserDefaults), set the string "Dark" as the value, and the themePreferenceKey as the key.
//    Create another function that does the same thing, but with a different color. Call the function setThemePreferenceToYourColorHere.
    func setThemePreferenceToDark(){
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    func setThemePreferenceToYourColorHere(){
        UserDefaults.standard.set("Darcula", forKey: themePreferenceKey)
    }
    
    
    
    
    
    
}
