//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Dillon P on 8/15/19.
//  Copyright © 2019 Dillon P. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    
    private func create(for title: String, with imageData: Data) {
        let photo = Photo(title: title, imageData: imageData)
        photos.append(photo)
    }
    
    private func update(photo: Photo, imageData: Data, title: String) {
        var newPhoto = photo
        if let index = photos.firstIndex(of: photo) {
            newPhoto.title = title
            newPhoto.imageData = imageData
            photos[index] = newPhoto
        }
    }
}
