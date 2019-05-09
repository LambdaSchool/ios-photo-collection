//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Hayden Hastings on 5/9/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    init(for themePreferenceKey: String) {
        self.themePreferenceKey = themePreferenceKey
    }
    
    let themePreferenceKey: String
}
