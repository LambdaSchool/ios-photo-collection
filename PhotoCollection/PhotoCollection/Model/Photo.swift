//
//  Photo.swift
//  PhotoCollection
//
//  Created by Chris Price on 12/12/19.
//  Copyright © 2019 Chris Price. All rights reserved.
//

import Foundation

struct Photo: Equatable {
    static func == (lhs: Photo, rhs: Photo) -> Bool {
        <#code#>
    }
    
    var imageData: Data
    var title: String
}
