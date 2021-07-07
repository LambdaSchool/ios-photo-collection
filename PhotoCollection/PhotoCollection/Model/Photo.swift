//
//  Photo.swift
//  PhotoCollection
//
//  Created by Alex Perse on 5/2/19.
//  Copyright © 2019 Alex Perse. All rights reserved.
//

import UIKit

class Photo {
    var imageData: Data
    var title: String
    
    init(imageData: Data, title: String) {
        self.imageData = imageData
            //UIImage(data: imageData)!
        self.title = title
    }
    
}
extension Photo : Equatable {
    static func == (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.imageData == rhs.imageData
    }
}
