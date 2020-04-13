//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Nichole Davidson on 2/27/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos: [Photo] = []
    
    func create(with imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
        
    }
    
    func update(photo: Photo, with imageData: Data, and title: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
        
        var newPhoto = photo
        newPhoto.imageData = imageData
        newPhoto.title = title
        
        photos.remove(at: index)
        photos.insert(newPhoto, at: index)
    }
}
