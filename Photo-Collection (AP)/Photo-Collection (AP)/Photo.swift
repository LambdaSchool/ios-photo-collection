//
//  Photo.swift
//  Photo-Collection (AP)
//
//  Created by Samuel Esserman on 2/27/20.
//  Copyright © 2020 Samuel Esserman. All rights reserved.
//

import Foundation

struct Photo: Equatable {
    var imageData: Data
    var title: String
    
    static func == (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.title == rhs.title && lhs.imageData == rhs.imageData
    }
}
