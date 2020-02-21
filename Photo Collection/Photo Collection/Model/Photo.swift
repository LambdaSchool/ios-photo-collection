//
//  Photo.swift
//  Photo Collection
//
//  Created by Juan M Mariscal on 2/20/20.
//  Copyright © 2020 Juan M Mariscal. All rights reserved.
//

import UIKit

struct Photo: Equatable{
    var imageData: Data
    var title: String
    
    init(imageData: Data, title: String) {
        self.imageData = imageData
        self.title = title
    }
}
