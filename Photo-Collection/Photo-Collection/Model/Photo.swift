//
//  Photo.swift
//  Photo-Collection
//
//  Created by Ilgar Ilyasov on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct Photo: Equatable {
    let imageData: Data
    let title: String
    
    init(title: String, imageData: Data) {
        self.title = title
        self.imageData = imageData
    }
}
