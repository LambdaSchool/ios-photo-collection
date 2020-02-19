//
//  Photo.swift
//  PhotoCollection
//
//  Created by admin on 9/19/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

struct Photo: Equatable {
    
    var imageData: Data
    var title: String
    
    init(imageData: Data, title: String) {
        self.imageData = imageData
        self.title = title
    }
}
