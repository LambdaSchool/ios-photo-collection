//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Tobi Kuyoro on 14/11/2019.
//  Copyright © 2019 Tobi Kuyoro. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos: [Photo] = []
    
    func create(photo: Photo) {
        photos.append(photo)
    }
    
    func update(photo: Photo, data: Data, string: String) {
        
    }
}
