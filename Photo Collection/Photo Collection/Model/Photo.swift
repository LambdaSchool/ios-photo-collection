//
//  Photo.swift
//  Photo Collection
//
//  Created by Stuart on 1/23/19.
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

//struct Photo {
//    var imageData: Data
//    var title: String
//}
