//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Jesse Ruiz on 9/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class PhotoController {
    
    // MARK: - Properties
    var photos: [Photo] = []
    
    // MARK: - Methods
    func create(image: Data, title: String) {
        let photo = Photo(imageData: image, title: title)
        photos.append(photo)
    }
    
    func update(photo: Photo, data: Data, string: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
        var newPhoto = photo
        newPhoto.imageData = data
        newPhoto.title = string
        photos.remove(at: index)
        photos.insert(newPhoto, at: index)
    }
}
