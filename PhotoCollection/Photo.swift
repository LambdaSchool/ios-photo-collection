//
//  Photo.swift
//  PhotoCollection
//
//  Created by Alex Perse on 5/2/19.
//  Copyright © 2019 Alex Perse. All rights reserved.
//

import UIKit

struct Photo: Equatable {
    
    var imageData: UIImage
    var title: String
    
    init(imageData: Data, title: String) {
        self.imageData = UIImage(data: imageData)!
        self.title = title
    }
    
}
