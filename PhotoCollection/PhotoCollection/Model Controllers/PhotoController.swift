//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Nathanael Youngren on 1/16/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func create(imageData: Data, title: String) {
        let newPhoto = Photo(imageData: imageData, title: title)
        photos.append(newPhoto)
    }
    
    func update(photo: Photo, data: Data, string: String) {
        guard let index = photos.index(of: photo) else { return }
        photos[index].imageData = data
        photos[index].title = string
    }
    
}
