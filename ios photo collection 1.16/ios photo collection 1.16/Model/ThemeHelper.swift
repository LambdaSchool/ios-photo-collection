import Foundation

class ThemeHelper {
    
  
    
    let themePreferenceKey: String = "themePreferenceKey"
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        return userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToReduceEyeStrain() {
        let userDefaults = UserDefaults.standard
        return userDefaults.set("Reduce", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        let userDefaults = UserDefaults.standard
        if let themePreference = userDefaults.string(forKey: themePreferenceKey) {
            return themePreference
        } else {
            return nil
        }
    }
        
    init() {
        // part 2 q 5
        
        
        if themePreferenceKey == nil {
            setThemePreferenceToDark()
        }
    }
}

