//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Stuart on 1/23/19.
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
    
    private(set) var photos: [Photo] = []
}
