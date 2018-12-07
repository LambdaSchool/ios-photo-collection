import UIKit

class ThemeSelectionViewController: UIViewController {

    @IBAction func setDarkTheme(_ sender: Any) {
        ThemeHelper.shared.setThemePreferenceToDark()
        dismiss(animated: true)
    }
    
    @IBAction func setLightTheme(_ sender: Any) {
        ThemeHelper.shared.setThemePreferenceToLight()
        dismiss(animated: true)
    }

}
