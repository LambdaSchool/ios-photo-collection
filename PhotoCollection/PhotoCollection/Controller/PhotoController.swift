//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Claudia Contreras on 2/20/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func create(imageData: Data, title: String) {
        let newPhoto = Photo(imageData: imageData, title: title)
        photos.append(newPhoto)
    }
    
    func update(Photo: Photo, data: Data, title: String) {
        if let index = photos.firstIndex(of: Photo) {
            var photo = photos[index]
            photo.title = title
            photo.imageData = data
            
            photos[index] = photo
        }
    }
    
}
