//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Rob Vance on 4/29/20.
//  Copyright © 2020 Robs Creations. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    // Creating a method and appending to a photo array
    
    func createPhoto(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    // Creating an update method that takes in the photo data parameters.
    
    func updatePhoto(photo: Photo, imageData: Data, imageTitle: String) {
        if let photoList = photos.firstIndex(of: photo) {
            photos[photoList].imageData = imageData
            photos[photoList].title = imageTitle
        }
    }
}
