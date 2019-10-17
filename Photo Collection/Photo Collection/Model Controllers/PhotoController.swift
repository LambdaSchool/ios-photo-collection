//
//  PhotoController.swift
//  Photo Collection
//
//  Created by morse on 10/17/19.
//  Copyright © 2019 morse. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func createPhoto(named title: String, with data: Data) {
        let photo = Photo(title: title, imageData: data)
        
        photos.append(photo)
    }
    
    func update(photo: Photo, named title: String, with data: Data) {
        guard let index = photos.firstIndex(of: photo) else { return }
        let photo = Photo(title: title, imageData: data)
        photos[index] = photo
    }
}
