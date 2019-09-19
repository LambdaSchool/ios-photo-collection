//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by admin on 9/19/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func create(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func update(photo: Photo, imageData: Data, title: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
        photos[index] = Photo(imageData: imageData, title: title)
    }
}
