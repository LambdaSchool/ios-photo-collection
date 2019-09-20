//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Gi Pyo Kim on 9/19/19.
//  Copyright © 2019 GIPGIP Studio. All rights reserved.
//

import Foundation
import UIKit

class ThemeHelper {
    // MARK: - Properties
    let themePreferenceKey: String = ""
    let lastRandomColorKey: String = "RandomColor"
    var randomColor: UIColor?
    
    var themePreference: String? {
        randomColor = UserDefaults.standard.colorForKey(key: lastRandomColorKey)
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    // MARK: - Initializer
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        } else if randomColor == nil {
            randomColor = UIColor.white
        }
    }
    
    // MARK: - Methods
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToRandom() {
        UserDefaults.standard.set("Random", forKey: themePreferenceKey)
        UserDefaults.standard.setColor(color: randomColor, forKey: lastRandomColorKey)
    }
    
}

// Storing UIColor into UserDefaults as Data
// https://www.sitepoint.com/store-uicolor-with-userdefaults-in-swift-3/
extension UserDefaults {
    func colorForKey(key: String) -> UIColor? {
        var color: UIColor?
        if let colorData = data(forKey: key) {
            do {
                try color = NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(colorData) as? UIColor
            } catch {
                print("Invalid colorData: \(error)")
            }
        }
        return color
    }
    
    func setColor(color: UIColor?, forKey key: String) {
        var colorData: NSData?
        if let color = color {
            do {
                try colorData = NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false) as NSData?
            } catch {
                print("Invalid color: \(error)")
            }
        }
        set(colorData, forKey: key)
    }
}
