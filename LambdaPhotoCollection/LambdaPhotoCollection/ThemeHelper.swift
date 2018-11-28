import UIKit

class ThemeHelper {
    
    let themePreferenceKey: String = "theme"
    
    func setThemePreferenceToDark() {
        return UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYellow() {
        return UserDefaults.standard.set("Yellow", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        
        if let themePreference = UserDefaults.standard.string(forKey: themePreferenceKey) {
            return themePreference
        } else {
            return nil
        }
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
}
