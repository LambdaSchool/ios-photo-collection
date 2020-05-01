//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Josh Kocsis on 4/30/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func create(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func update(photo: Photo, imageData: Data, title: String) {
        if let photo = photos.firstIndex(of: photo) {
            photos[photo].imageData = imageData
            photos[photo].title = title
        }
    }
}
