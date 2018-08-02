//
//  File.swift
//  ios-photo-collection
//
//  Created by De MicheliStefano on 02.08.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

import Foundation

class PhotoController {
    
    func create(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func update(photo: Photo, imageData: Data, title: String) {
        guard let index = photos.index(of: photo) else { return }
        var photo = photos[index]
        photo.imageData = imageData
        photo.title = title
        
        photos.remove(at: index)
        photos.insert(photo, at: index)
    }
    
    var photos: [Photo] = []
    
}
