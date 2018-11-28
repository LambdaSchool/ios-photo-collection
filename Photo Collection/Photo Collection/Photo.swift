//
//  Photo.swift
//  Photo Collection
//
//  Created by Ivan Caldwell on 11/28/18.
//  Copyright © 2018 Ivan Caldwell. All rights reserved.
//

import Foundation
struct Photo: Equatable {
    var imageData: Data
    var title: String
    
    init (imageData: Data, title: String) {
        self.imageData = imageData
        self.title = title
    }
}

// Adopt the `Equatable Protocol.
