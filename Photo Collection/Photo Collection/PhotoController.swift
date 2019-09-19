//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Isaac Lyons on 9/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func createPhoto(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func updatePhoto(photo: Photo, imageData: Data, title: String) {
        if let index = photos.firstIndex(of: photo) {
            let updatedPhoto = Photo(imageData: imageData, title: title)
            photos[index] = updatedPhoto
        }
    }
}
