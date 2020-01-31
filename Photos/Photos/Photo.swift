//
//  Photo.swift
//  Photos
//
//  Created by scott harris on 1/30/20.
//  Copyright © 2020 scott harris. All rights reserved.
//

import Foundation

struct Photo: Equatable {
    var title: String
    var imageData: Data
    
    static func == (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.title == rhs.title && lhs.imageData == rhs.imageData
    }
    
}
