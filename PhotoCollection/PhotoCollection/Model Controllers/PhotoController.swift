//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Dennis Rudolph on 10/17/19.
//  Copyright © 2019 LambdaSchool. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos: [Photo] = []
    
    func create(imageData: Data, title: String) {
        let photo = Photo(title: title, imageData: imageData)
        photos.append(photo)
    }
    
    func update(photo: Photo, imageData: Data, title: String) {
        if let index = photos.firstIndex(of: photo) {
            photos[index].imageData = imageData
            photos[index].title = title
        }
    }
}
