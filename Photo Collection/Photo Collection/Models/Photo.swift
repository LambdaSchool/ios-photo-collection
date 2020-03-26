//
//  Photo.swift
//  Photo Collection
//
//  Created by Joseph Rogers on 8/16/19.
//  Copyright © 2019 Joe Rogers. All rights reserved.
//

import Foundation

    //MARK: Models
    //Here we created a simple model that explains the Data aka properies of what makes a photo in our application.
struct Photo: Equatable {
    var imageData: Data
    var title: String
    
    init(imageData: Data, title: String) {
        self.imageData = imageData
        self.title = title
    }
}
