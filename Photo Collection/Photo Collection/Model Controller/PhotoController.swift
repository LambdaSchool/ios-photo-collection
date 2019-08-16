//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Joseph Rogers on 8/16/19.
//  Copyright © 2019 Joe Rogers. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func addPhoto(data: Data, title: String) {
        let photoAdded = Photo(imageData: data, title: title)
        photos.append(photoAdded)
    }
    
    func updatePhoto(photo: Photo, newdata: Data, newTitle: String) {
        
    }
}
