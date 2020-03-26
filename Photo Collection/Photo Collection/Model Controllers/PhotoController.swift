//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Cody Morley on 3/26/20.
//  Copyright © 2020 Cody Morley. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func create(imageData: Data, title: String) {
        let newPhoto = Photo(imageData: imageData, title: title)
        photos.append(newPhoto)
    }
    
    func update(photo: Photo, data: Data, string: String) {
        
    }
}
