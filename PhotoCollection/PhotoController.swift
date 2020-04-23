//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Nonye on 4/23/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos: [Photo] = []
    
    func create(imageDate: Data, title: String) {
        let photo = Photo(title: title, imageData: imageDate)
        photos.append(photo)
    }
    func update(photo: Photo, data: Data, string: String) {
        
    }
}
