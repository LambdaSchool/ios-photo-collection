//
//  Photo.swift
//  Photo Collection
//
//  Created by Stuart on 1/23/19.
//  Copyright © 2019 Stuart. All rights reserved.
//

import UIKit

struct Photo: Equatable {
    var imageData: UIImage
    var title: String
    
    init(imageData: UIImage, title: String) {
        self.title = title
        self.imageData = imageData
    }
    
    // Custom init for loading assets into array
    init(title: String, imageData: String) {
        self.title = title
        self.imageData = UIImage(named: imageData)!
    }
}
