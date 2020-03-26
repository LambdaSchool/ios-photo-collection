//
//  ThemeHelper.swift
//  PhotoProject
//
//  Created by Mark Poggi on 3/26/20.
//  Copyright © 2020 Mark Poggi. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey: String?
    let colorPreferenceKey: String?
    
    init(themePreferenceKey: String, colorPreferenceKey: String) {
        self.themePreferenceKey = themePreferenceKey
        self.colorPreferenceKey = colorPreferenceKey
    }
    
}
