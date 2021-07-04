import Foundation

class ThemeHelper {
    
    let themePreferenceKey = "themePreferenceKey"
    
    func setThemePreferencetoBlack() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Black", forKey: themePreferenceKey)
    }
    
    func setThemePreferencetoGray() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Gray", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        guard let selectedThemePreference = UserDefaults.standard.string(forKey: themePreferenceKey) else { return "" }
        
        switch selectedThemePreference {
        case "Gray":
            setThemePreferencetoGray()
        case "Black":
            setThemePreferencetoBlack()
        default:
            break
            // UserDefaults.standard
        }
        
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
}
