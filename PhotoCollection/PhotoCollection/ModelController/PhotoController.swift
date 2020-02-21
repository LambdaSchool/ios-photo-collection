//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Rob Vance on 2/20/20.
//  Copyright © 2020 Rob Vance. All rights reserved.
//

import Foundation
class PhotoController {
    var photos: [Photo] = []

    
    // creating a method and appending to the photo array
    
    func createPhoto(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    // creating an update method that takes in the photo data parameters.
    
    func updatePhoto(photo: Photo, imageData: Data, imageTitle: String) {
        if let photoList = photos.firstIndex(of: photo) {
            photos[photoList].imageData = imageData
            photos[photoList].title = imageTitle
        }
    }
}
