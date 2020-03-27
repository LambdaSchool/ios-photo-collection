//
//  Photo.swift
//  Photo Collection
//
//  Created by Chris Dobek on 3/26/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

import Foundation

struct Photo: Equatable {
    var title: String
    var imageData: Data
    
    
    static func == (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.title == rhs.title && lhs.imageData == rhs.imageData
    }
}
