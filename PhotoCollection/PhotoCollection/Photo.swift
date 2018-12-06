//
//  Photo.swift
//  PhotoCollection
//
//  Created by Sameera Leola on 12/6/18.
//  Copyright © 2018 Sameera Leola. All rights reserved.
//

import UIKit

class Photo {
    var title: String
    var imageData: Data //We are storing the data bits and bytes of the image
    
    init(title: String,imageData: Data) {
        self.title = title
        self.imageData = imageData
    }
    
//    convenience init? (title: String, image: UIImage) {
//        guard let imageData = image.pngData() else { return }
//        self.init(title: title, imageData: imageData)
//    }
    
}
