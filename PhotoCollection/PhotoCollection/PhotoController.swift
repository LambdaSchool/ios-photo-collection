//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Jordan Christensen on 8/23/19.
//  Copyright © 2019 Mazjap Co Technologies. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func addPhoto(title: String, imageData: Data) {
        let photo = Photo(title: title, imageData: imageData)
        photos.append(photo)
    }
    
    func update(from photo: Photo, title: String, imageData: Data) {
        guard let index = photos.firstIndex(of: photo) else { return }
        photos[index] = Photo(title: title, imageData: imageData)
    }
}
