//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Harmony Radley on 2/27/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

import Foundation

class PhotoController {
    
    
    var photos: [Photo] = []
    
    func create(imageDate: Data, title: String) {
        let photo = Photo(imageData: imageDate, title: title)
        photos.append(photo)
    }
    
    func update(photo: Photo, imageData: Data, title: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
        photos[index] = Photo(imageData: imageData, title: title)
    }
    
    
    
    
}
