//
//  PhotoController.swift
//  Photo-Collection (AP)
//
//  Created by Samuel Esserman on 2/27/20.
//  Copyright © 2020 Samuel Esserman. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func createPhoto(title: String, imageData: Data) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func update(photo: Photo, title: String, data: Data) {
        if let index = photos.firstIndex(of: photo) {
            var photo = photos[index]
            photo.title = title
            photo.imageData = data
        }
    }
}
