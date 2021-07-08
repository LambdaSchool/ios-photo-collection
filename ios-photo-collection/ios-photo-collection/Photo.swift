//
//  Photo.swift
//  ios-photo-collection
//
//  Created by Benjamin Hakes on 11/28/18.
//  Copyright © 2018 Benjamin Hakes. All rights reserved.
//

import Foundation

struct Photo: Equatable {
    let imageData: Data
    let title: String
    
    init(_ imageData: Data,_ title: String){
        self.imageData = imageData
        self.title = title
    }
}
