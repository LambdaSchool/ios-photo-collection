//
//  Photo.swift
//  PhotoProject
//
//  Created by Mark Poggi on 3/26/20.
//  Copyright © 2020 Mark Poggi. All rights reserved.
//

import Foundation

struct Photo: Equatable {
    var imageData: Data
    var title: String
   
    init(imageData: Data, title: String) {
        self.title = title
        self.imageData = imageData
    }
}
