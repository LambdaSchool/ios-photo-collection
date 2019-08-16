//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by John Kouris on 8/15/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func create(image: Data, title: String) {
        let photo = Photo(imageData: image, title: title)
        photos.append(photo)
    }
    
    func update(photo: Photo, image: Data, title: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
        var updatedPhoto = photo
        photos.remove(at: index)
        
        updatedPhoto.imageData = image
        updatedPhoto.title = title
        photos.append(updatedPhoto)
    }
}
