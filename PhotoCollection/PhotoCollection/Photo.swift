//
//  Photo.swift
//  PhotoCollection
//
//  Created by Stuart on 1/16/19.
//  Copyright © 2019 Stuart. All rights reserved.
//

import Foundation

class Photo {
    var imageData: Data
    var title: String
    
    init(imageData: Data, title: String) {
        self.imageData = imageData
        self.title = title
    }
}
