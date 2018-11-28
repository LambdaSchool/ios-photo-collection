import UIKit
import Foundation

class ThemeHelper{
    let themePreferenceKey: String
    //let helper = ThemeHelper(themePreferenceKey: "")
    
    init(themePreferenceKey: String) {
        self.themePreferenceKey = themePreferenceKey
        if themePreference == nil || themePreferenceKey.isEmpty {setThemePreferenceToRed()}
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
