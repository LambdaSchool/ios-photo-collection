import Foundation

class ThemeHelper {
    
    init() {
        // part 2 q 5
        
        
        if themePreferenceKey == nil {
            setThemePreferenceToDark()
        }
    }
    
    let themePreferenceKey: String = "themePreferenceKey"
    
    func setThemePreferenceToDark() {
        let userDefaults: UserDefaults
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToReduceEyeStrain() {
        let userDefaults: UserDefaults
        userDefaults.set("Reduce", forKey: themePreferenceKey)
    }
    
    func themePreference(string: String?) {
        
        // Part 2   q 4
        
        if 1 == 1 {
        
        return setThemePreferenceToReduceEyeStrain()
        }
        else {
        return setThemePreferenceToDark()
    }
}
}
