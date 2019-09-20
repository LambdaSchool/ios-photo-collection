//
//  PhotoController.swift
//  Photo Collection
//
//  Created by macbook on 9/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


class PhotoController {
    var photos: [Photo] = []
    
    // MARK: - Creating a new Photo
    func createPhoto(imageData: Data, title: String) {
        
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    
    
    // TODO: - Update the updating photo method
    // MARK: - Updating a Photo
    func updatePhoto(photo:Photo, imageData: Data, title: String) {
        
        guard let index = photos.index(of: photo) else { return }
        photos[index].title = title
        photos[index].imageData = imageData
        
        
        
//        var photo = photos[index]
//        photo.title = title
//        photo.imageData = imageData
//

    }
}

