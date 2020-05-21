//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Richard Gibbs on 5/21/20.
//  Copyright © 2020 Rich Gibbs. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []

    func createPhoto(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func updatePhoto(photo: Photo, data: Data, string: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
        var photo = photos[index] // specific photo from the index
        photo.imageData = data // passing that new value into parameter up top
        photo.title = string // ditto 
    }
}
