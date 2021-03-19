//
//  Photo.swift
//  PhotoCollection Project
//
//  Created by Michael Flowers on 1/16/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation

class Photo {
    var imageData: Data
    var title: String
    
    init(imageData: Data, title: String){
        self.imageData = imageData
        self.title = title
    }
}

extension Photo: Equatable {
    static func == (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.imageData == rhs.imageData && lhs.title == rhs.title
    }
    
    
}

