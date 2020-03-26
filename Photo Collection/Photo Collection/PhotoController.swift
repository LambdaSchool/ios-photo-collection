//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Chris Dobek on 3/26/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    
    func createPhoto(title: String, imageData: Data) {
        let photo = Photo(title: title, imageData: imageData)
        photos.append(photo)
    }
    
    func update(photo: Photo, title: String, imageData: Data) {
        if let index = photos.firstIndex(of: photo) {
        var photo = photos[index]
        photo.title = title
        photo.imageData = imageData
        }
    }
}
