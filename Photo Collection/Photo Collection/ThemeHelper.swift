//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Ivan Caldwell on 11/28/18.
//  Copyright © 2018 Ivan Caldwell. All rights reserved.
//

import Foundation
//Create a "ThemeHelper.swift" file.
// Add a ThemeHelper class inside of it.
class ThemeHelper {
    // Create a string constant called themePreferenceKey
    let themePreferenceKey: String
    
    init( ) {
        <#statements#>
    }

    // Create a function called setThemePreferenceToDark(). Using the set method of UserDefaults
    // (remember that in order to access set, you have to use the standard property on UserDefaults)
    // set the string "Dark" as the value, and the themePreferenceKey as the key.
    func setThemePreferenceToDark() {
        let dark = UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    // Create another function that does the same thing, but with a different color. Call the
    // function setThemePreferenceToYourColorHere.
    func setThemePreferenceToYellow() {
        let blue = UserDefaults.standard.set("Blue", forKey: themePreferenceKey)
    }
    
    
    // Finally, create a computed property called themePreference of type String?. This should
    // simply return the string value that you stored from either of the two methods you wrote
    // above. Use the UserDefaults string(forKey: ...) method to get that value. The method should
    // return an optional string because if the user's theme preference hasn't been saved, the value
    // returned from UserDefaults will be nil.
    let themePreference: String? {
        get {
        }
    }
}
