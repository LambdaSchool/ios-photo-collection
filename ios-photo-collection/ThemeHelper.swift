import Foundation

class ThemeHelper{
    let themePreferenceKey = "ThemePreferenceKey"
    let userDefaults = UserDefaults.standard

    //dark
    func setThemePreferenceToDark(){
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    //create your own color
    func setThemePreferenceToBlue(){
        userDefaults.set("Blue", forKey: themePreferenceKey)
    }
    
    //optional preference
    var themePreference: String? {
        if let themePreference = userDefaults.string(forKey: themePreferenceKey){
            return themePreference
        }
        else{ return nil}
        
        
        
    }
    init(){
        if themePreference == nil{
            setThemePreferenceToDark()
        }
    }
}

