//
//  Photo.swift
//  PhotoCollection
//
//  Created by Cameron Collins on 3/26/20.
//  Copyright © 2020 Cameron Collins. All rights reserved.
//

import Foundation

struct Photo: Equatable {
    static func == (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.title == rhs.title
    }
    var imageData: Data
    var title: String
}
