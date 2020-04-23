//
//  Photo.swift
//  Photo Collection
//
//  Created by Vincent Hoang on 4/23/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

import Foundation

struct Photo: Equatable {
    var imageData: Data
    var title: String
    
    init(_ imageData: Data, _ title: String) {
        self.imageData = imageData
        self.title = title
    }
}
