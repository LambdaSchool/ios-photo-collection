//
//  Photo.swift
//  PhotoIOSPT5
//
//  Created by David Williams on 2/19/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import Foundation

struct Photo: Codable, Equatable {
   var imageData: Data
    var title: String
    
    init(title: String, imageData: Data) {
        self.title = title
        self.imageData = imageData
    }
}
