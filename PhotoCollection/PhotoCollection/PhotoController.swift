//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Stuart on 1/16/19.
//  Copyright © 2019 Stuart. All rights reserved.
//

import Foundation

class PhotoController {
    
    func createPhoto(with image: Data, and title: String) {
        let photo = Photo(imageData: image, title: title)
        photos.append(photo)
    }
    
    func update(photo: Photo, withNew image: Data, and title: String) {
        photo.imageData = image
        photo.title = title
    }

    var photos: [Photo] = []
}
