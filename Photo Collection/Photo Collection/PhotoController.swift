//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Harmony Radley on 3/26/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

import Foundation

class PhotoController {
    // var photos: [Photo]() didn't work?
    var photos: [Photo] = []


// Create

func createPhoto(imageData: Data, title: String) {
    let photo = Photo(imageData: imageData, title: title)
    
    photos.append(photo)
}

// Update Method
    
    func update(photo: Photo, imageData: Data, title: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
        var newPhoto = photo
            newPhoto.imageData = imageData
            newPhoto.title = title
        photos.remove(at: index)
        photos.insert(newPhoto, at: index)
    }
    
    
    
    
    
}


