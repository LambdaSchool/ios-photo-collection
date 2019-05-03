import UIKit
import Foundation




class ThemeHelper{
    
    let themePreferenceKey: String = "THEME_PREF"
    
    init(){
        
        if themePreference == nil || themePreference == "" {
            setThemePreferenceToRed()
        }
    }
    
    func setThemePreferenceToDark(){
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToRed(){
        UserDefaults.standard.set("Red", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
         return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    
}
