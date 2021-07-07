//
//  Photo.swift
//  Photo Collection
//
//  Created by Moses Robinson on 1/16/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

import UIKit

struct Photo: Equatable {
    
    var imageData: Data
    var title: String
    
    init(imageData: Data, title: String) {
        (self.imageData, self.title) = (imageData, title)
    }
}
