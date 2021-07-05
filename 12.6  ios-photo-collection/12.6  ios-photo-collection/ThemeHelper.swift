import Foundation

class ThemeHelper {
    static let shared = ThemeHelper()
    private init () {
        // checks if there is a preference and if there isn't, sets a default
        if UserDefaults.standard.string(forKey: themePreferenceKey) == nil {
            UserDefaults.standard.set("Light", forKey: themePreferenceKey)
        }
    }
    
    let themePreferenceKey = "ThemePreferenceKey"
    // returns current settings -- saves it
    var themePreference: String {
        return UserDefaults.standard.string(forKey: themePreferenceKey) ?? "Light"
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToLight() {
        UserDefaults.standard.set("Light", forKey: themePreferenceKey)
    }
}
