//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Bohdan Tkachenko on 4/30/20.
//  Copyright © 2020 Bohdan Tkachenko. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func create(forImage image: Data, title: String) {
        let newPhoto = Photo(imageData: image, title: title)
        photos.append(newPhoto)
    }
    
    func update(photo: Photo, image: Data, title: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
        
        var updatedPhoto = photo
        updatedPhoto.imageData = image
        updatedPhoto.title = title
        
        photos.remove(at: index)
        photos.insert(updatedPhoto, at: index)
    }
    
    
}
